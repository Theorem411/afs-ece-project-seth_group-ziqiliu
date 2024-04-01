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


//======== each instance should represents a specification of template function parallel_for defined in opencilk.h
struct ParallelFor {
    ParallelFor(
        Function &F, PRState prs, StringRef spname, StringRef tempfile) 
    : F(F), prs(prs), spname(spname), tempfile(tempfile) {}

    // parent function query
    Function &getFunction() const { return F; }
    StringRef getFuncName() const { return F.getName(); }

    // template file query
    StringRef getTemplateFile() const { return tempfile; }

    // DISubprogram name 
    StringRef getSpName() const { return spname; }

    // parallel_for spec function PRState query
    PRState getPRS() const { return prs; }
    StringRef getPRSName() const { return printPRState(prs); }

private:
    Function &F;        // parallel_for specification as llvm function IR
    PRState prs;        // prstate
    StringRef spname;   // DISubprogram name field (key)
    StringRef tempfile; // template file name
};

//============ CSV output helper class =====================================
struct CsvRow {
    CsvRow(Function &Func, PRState prs, StringRef SpName, StringRef TempFile) : 
        Func(Func), prs(prs), SpName(SpName), TempFile(TempFile) {}
    // CsvRow(std::string FuncName, std::string FileName, std::string DirName, std::string ln, std::string prs) 
    //     : FuncName(FuncName), FileName(FileName), DirName(DirName), ln(ln), prs(prs) {}

    // emit a row of csv output
    std::string emit() const {
        return printPRState(prs).str() + "," 
            + SpName.str() + ","
            + TempFile.str() + "," 
            + Func.getName().str() + "\n";
    }
private: 
    Function &Func;
    PRState prs;
    StringRef SpName;
    StringRef TempFile;
};

struct CSV {
    CSV() {}
    // CSV(SmallVector &rows) : rows(rows) {}
public:
    void add(CsvRow &row) {
        rows.push_back(row);
    }
    std::string emitHeader() const {
        return "prs,sp_name,temp_file,pfor\n";
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
    // Parallel_for name parsing "parallel_for<(lambda at ...": modify filename, ln, col
    ParallelFor *getParallelForMetadata(Function &F, DISubprogram *SP);

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

ParallelFor *ParallelForDebugInfoImpl::getParallelForMetadata(Function &F, DISubprogram *SP) {
    // mdnode field: name
    StringRef spname = SP->getName();

    if(!spname.startswith(StringRef("parallel_for<(lambda at "))) 
        return nullptr;
    // mdnode field: file (template file)
    DIFile *DIF = SP->getFile();
    assert(DIF && "DIF empty!");
    StringRef tempfile = DIF->getFilename();
    // errs() << F.getName() << "\n" << "  " << tempfile << "\n";
    
    ParallelFor *pfor = new ParallelFor(F, PR[&F], spname, tempfile); 
    return pfor;
}

void ParallelForDebugInfoImpl::run() {
    //=== Find all parallel_for specification declaration ===========
    for (Function &F : M) {
        if (F.isDeclaration()) 
            continue;
        
        DISubprogram *SP = F.getSubprogram();
        if (!SP)
            continue;

        if (ParallelFor *PFor = getParallelForMetadata(F, SP)) {
            // found parallel_for!

            // get parallel_for spec function prstate
            PRState prs = PR[&F];

            // record PFor
            ParallelForMap[&F] = PFor;

            // // append parallel for info to csv
            CsvRow csvr(PFor->getFunction(), PFor->getPRS(), PFor->getSpName(), PFor->getTemplateFile());
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
                // errs() << "parallel_for spec has inconsistent prs: " << PFor->getFuncName(); 
                // errs() << "\n  Block: " << printPRState(prs) << "   Func: " << printPRState(PFor->getPRS()) << "\n";
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
    fd << StringRef(csv.emitHeader());
    // rows
    for (auto &row : csv.rows) {
        fd << StringRef(row.emit());
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