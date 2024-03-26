/*****************************************************************************/
// print out source-level debug info for parallel_for template functions calls in pbbs_v2 
/*****************************************************************************/
#include "llvm/Pass.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Transforms/ULI/ParallelRegion.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/JSON.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include <utility> 

using namespace llvm;

#define PBBSV2_NAME "pbbsv2-dbg"
#define DEBUG_TYPE PBBSV2_NAME

cl::opt<std::string> TestName(
    "test", 
    cl::init("default"), 
    cl::Hidden,
    cl::desc("name of benchmark test case")
);

namespace {
//========= global utitlity functions ========================
// Parallel_for name parsing "parallel_for<(lambda at ...": modify filename, ln, col
bool parseParallelForSPName(StringRef PForName, std::string &filename, uint64_t &ln, uint64_t &col) {
    // pre-screen
    StringRef ParallelForNamePrefix("parallel_for<(lambda at ");
    if(!PForName.startswith(ParallelForNamePrefix)) 
        return false;
    outs() << "found parallel_for<(lambda at)!\n";
    // first section: looking for <filename>.C
    auto pair = PForName.split(':');
    StringRef substr = pair.first;
    StringRef filenameStr = substr.split(ParallelForNamePrefix).second;
    if (filenameStr.empty()) 
        return false;

    StringRef rest = pair.second;
    if (rest.empty())
        return false;
    
    // second section: looking for <line_number>
    pair = rest.split(':');
    StringRef lnStr = pair.first;
    

    rest = pair.second;
    if (rest.empty()) 
        return false;

    // third section: looking for <col number>
    pair = rest.split(")>");
    StringRef colStr = pair.first;

    // return result by modifying reference
    if (!lnStr.getAsInteger(/*radix:autosensing*/0, ln)) {
        return false;
    }
    if (!colStr.getAsInteger(/*radix:autosensing*/0, col)) {
        return false;
    }
    filename = filenameStr.str();

    return true;
}

//======== each instance should represents a specification of template function parallel_for defined in opencilk.h
struct ParallelFor {
    ParallelFor(Function &F, DISubprogram &SP, PRState prs, StringRef filename, uint64_t ln, uint64_t col) 
        : F(F), SP(SP), prs(prs), filename(filename), ln(ln), col(col) {}

    // parent function query
    Function &getFunction() const { return F; }
    StringRef getFuncName() const { return F.getName(); }

    // template file query
    StringRef getTemplateFile() const { 
        std::string FileName = (SP.getFile())->getFilename().str();
        std::string DirName = SP.getDirectory().str();
        return StringRef(DirName + '/' + FileName); 
    }

    // source file / callsite query
    StringRef getSourceFile() const { return filename; }
    uint64_t getLine() const { return ln; }
    uint64_t getCol() const { return col; }

    // parallel_for spec function PRState query
    PRState getPRS() const { return prs; }
    StringRef getPRSName() const { return printPRState(prs); }

private:
    Function &F;        // parallel_for specification as llvm function IR
    PRState prs;        // prstate
    DISubprogram &SP;   // DISubprogram metadata: contains template file info
    StringRef filename; // source file name 
    uint64_t ln;        // source file/callsite line number
    uint64_t col;       // source file/callsite col number
};

//============ CSV output helper class =====================================
struct CsvRow {
    CsvRow(StringRef Func, StringRef SrcFile, StringRef TempFile, StringRef ln, StringRef col, StringRef prs) : 
        Func(Func), SrcFile(SrcFile), TempFile(TempFile), ln(ln), col(col), prs(prs) {}
    // CsvRow(std::string FuncName, std::string FileName, std::string DirName, std::string ln, std::string prs) 
    //     : FuncName(FuncName), FileName(FileName), DirName(DirName), ln(ln), prs(prs) {}

    // emit a row of csv output
    StringRef emit() const {
        StringRef s(
            ln.str() + "," 
            + col.str() + "," 
            + prs.str() + "," 
            + SrcFile.str() + "," 
            + TempFile.str() + "," 
            + Func.str() + "\n"
        );
        return s;
    }
private: 
    StringRef Func;
    StringRef SrcFile;
    StringRef TempFile;
    StringRef ln;
    StringRef col;
    StringRef prs;
};

struct CSV {
    CSV() {}
    // CSV(SmallVector &rows) : rows(rows) {}
public:
    void add(CsvRow &row) {
        rows.push_back(row);
    }
    StringRef emitHeader() const {
        return StringRef("ln,col,prs,file,temp_file,pfor\n");
    }
public: 
    SmallVector<CsvRow, 8> rows;
};

//=========== PbbsV2 ParallelFor template spec implementation ==============
struct ParallelForDebugInfoImpl {
    ParallelForDebugInfoImpl(Module &M, const ParallelRegion &PR) : M(M), PR(PR) {}
    ~ParallelForDebugInfoImpl() {
        for (auto &it : ParallelForMap) {
            delete it.second; 
        }
        ParallelForMap.clear();
    }
    void run();
private: 
    // parallel_for specification identifier
    bool isParallelForSpecfication(Function &F) const {
        DISubprogram *SP = F.getSubprogram();
        if (!SP)
            return false;
        // identify parallel for spec from DISubprogram using parseParallelForSPName 
        std::string fn; // init by parseParallelForSPName
        uint64_t ln, col; // init by parseParallelForSPName
        return parseParallelForSPName(SP->getName(), fn, ln, col);
    }
    // I/O utility
    void flushCSV() const;
private:  
    Module &M;
    const ParallelRegion &PR;
    // record all parallel_for spec
    DenseMap<Function *, ParallelFor *> ParallelForMap;
    // final csv output representation
    CSV csv;
};

void ParallelForDebugInfoImpl::run() {
    //=== Find all parallel_for specification declaration ===========
    for (Function &F : M) {
        if (F.isDeclaration()) 
            continue;
        
        DISubprogram *SP = F.getSubprogram();
        if (!SP)
            continue;

        std::string fn; // init by parseParallelForSPName
        uint64_t ln, col; // init by parseParallelForSPName
        if (parseParallelForSPName(SP->getName(), fn, ln, col)) {
            // found parallel_for!

            // get parallel_for spec function prstate
            PRState prs = PR[&F];

            // construct ParallelFor
            ParallelFor *PFor = new ParallelFor(F, *SP, prs, StringRef(fn), ln, col);

            // record PFor
            ParallelForMap[&F] = PFor;

            // // append parallel for info to csv
            CsvRow csvr(
                PFor->getFuncName(), PFor->getSourceFile(), PFor->getTemplateFile(), 
                StringRef(std::to_string(PFor->getLine())), StringRef(std::to_string(PFor->getCol())), 
                PFor->getPRSName()
            );
            csv.add(csvr);
        }
    }

    //=== Find all parallel_for spec callsite
    for (Function &F : M) {
        for (auto I = inst_begin(F), E = inst_end(F); I != E; ++I) {
            Function *PforFunc = nullptr; 
            if (auto *CI = dyn_cast<CallInst>(&*I)) {
                PforFunc = CI->getCalledFunction();
            } else if (auto *VI = dyn_cast<InvokeInst>(&*I)) {
                PforFunc = VI->getCalledFunction();
            }
            // not callinst or invokeinst
            if (!PforFunc)
                continue;
            // must be parallel_for 
            if (ParallelForMap.find(PforFunc) == ParallelForMap.end()) 
                continue;
            ParallelFor *PFor = ParallelForMap[PforFunc];

            // get block PRState
            BasicBlock *B = I->getParent();
            PRState prs = PR[B];
            if (prs != PFor->getPRS()) {
                errs() << "parallel_for spec has inconsistent prs: " << PFor->getFuncName() << "\n";
            }
        }
    }

    // flush result to a csv
    flushCSV();
}

void ParallelForDebugInfoImpl::flushCSV() const {
    std::string fname = TestName + ".dbg.csv";
    outs() << "\n------\nFileName: " << fname << "\n";

    std::error_code EC;
    raw_fd_ostream fd(fname, EC);
    if (EC) {
        errs() << "Error opening file: " << EC.message() << "\n";
        return;
    }

    // header
    fd << csv.emitHeader();
    // rows
    for (auto &row : csv.rows) {
        fd << row.emit();
    }
}

//============ New Pass Manager Module Pass ======================
struct ParallelForDebugInfo : public PassInfoMixin<ParallelForDebugInfo> {
    explicit ParallelForDebugInfo() {};

    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        const ParallelRegion &PR = AM.getResult<ParallelRegionAnalysis>(M);
        ParallelForDebugInfoImpl(M, PR).run();
        return PreservedAnalyses::all();
    }
};

} // end namespace 

//============ New Pass Manager Library Plugin ======================
PassPluginLibraryInfo getParallelRegionStatsPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        // register printer pass for opt's -passes="pbbsv2-dbg"
        PB.registerPipelineParsingCallback(
            [](StringRef Name, ModulePassManager &PM, auto ) {
                if (Name == PBBSV2_NAME) {
                    PM.addPass(ParallelForDebugInfo());
                    return true;
                }
                return false;
            }
        );
    };

    return {LLVM_PLUGIN_API_VERSION, PBBSV2_NAME, "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getParallelRegionStatsPluginInfo();
}