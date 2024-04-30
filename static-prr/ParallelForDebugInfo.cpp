/*****************************************************************************
* ParallelForDebugInfo pass: This pass contains three functionality
* 1) output .dbg.csv file containing ParallelRegion analysis state results 
* 2) print/write to file the source code location of each cilk_for
*****************************************************************************/
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
    CsvRow(Function &F, PRState prs, StringRef SpName, StringRef TempFile, StringRef LinkageName) : 
        F(F), prs(prs), SpName(SpName), TempFile(TempFile), LinkageName(LinkageName) {}
    // CsvRow(std::string FuncName, std::string FileName, std::string DirName, std::string ln, std::string prs) 
    //     : FuncName(FuncName), FileName(FileName), DirName(DirName), ln(ln), prs(prs) {}

    // emit a row of csv output
    std::string emit() const {
        return printPRState(prs).str() + "," 
            + '\"' + SpName.str() + '\"' + ","
            + LinkageName.str() + "," 
            + TempFile.str() + "\n";
    }
private: 
    Function &F;
    PRState prs;
    StringRef SpName;
    StringRef TempFile;
    StringRef LinkageName;
};

struct CSV {
    CSV() {}
    // CSV(SmallVector &rows) : rows(rows) {}
public:
    void add(CsvRow &row) {
        rows.push_back(row);
    }
    std::string emitHeader() const {
        return "prs,sp_name,linkage_name,temp_file\n";
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
    void runOnFunction(Function &F, std::function<LoopInfo &(Function &)> getLI, 
                        std::function<TaskInfo &(Function &)> getTI);
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

void ParallelForDebugInfoImpl::run(
        std::function<LoopInfo &(Function &)> getLI, 
        std::function<TaskInfo &(Function &)> getTI) {
    /******************** Output .dbg.csv file ******************************/
    //=== Find all parallel_for specification declaration ===========
    for (Function &F : M) {
        if (F.isDeclaration()) 
            continue;
        
        DISubprogram *SP = F.getSubprogram();
        if (!SP)
            continue;
        // mdnode field: file (template file)
        DIFile *DIF = SP->getFile();
        assert(DIF && "DIF empty!");
        StringRef tempfile = DIF->getFilename();
        
        // mdnode field: linkage name
        StringRef linkname = SP->getLinkageName();
        // get parallel_for spec function prstate
        PRState prs = PR[&F];

        // // append parallel for info to csv
        CsvRow row(F, prs, SP->getName(), tempfile, linkname);
        csv.add(row);
    }
    
    // flush result to a csv
    flushCSV();

    /*********** Output cilk_for source-level information *******************/
    for (Function &F : M) {
        if (F.isDeclaration()) 
            continue;
        runOnFunction(F, getLI, getTI);
    }
}

/**
 * For each cilk_for, print out the DebugLoc of the first instruction 
*/
void ParallelForDebugInfoImpl::runOnFunction(
        Function &F, 
        std::function<LoopInfo &(Function &)> getLI, 
        std::function<TaskInfo &(Function &)> getTI) {
    TaskInfo &TI = getTI(F);
    LoopInfo &LI = getLI(F);
    if (TI.isSerial()) {
        continue;
    }
    for (Loop *TopLoop : LI) {
        for (Loop *L : post_order(TopLoop)) {
            if (Task *T = llvm::getTaskIfTapirLoopStructure(L, &TI)) {
                /* print out 
                 * 1) original llvm instruction 
                 * 2) if there are inlineAt info, print out source code loc
                 * 3) the final source code level location
                 */
                Instruction *LoopInstr = L->getHeader()->getFirstNonPHIOrDbg();
                std::string s;
                {
                    raw_string_ostream ros(s);
                    LoopInstr->print(ros);
                    ros.flush();
                }
                LLVM_DEBUG(dbgs() << "cilk_for first instr:\n" << StringRef(s) << '\n');
                const DebugLoc &DLoc = LoopInstr->getDebugLoc(); 
                if (!DLoc || !DLoc.get()) {
                    LLVM_DEBUG(dbgs() << "\tno valid DILocation info!\n");
                    continue;
                }
                // print DebugLoc of instruction
                DILocation *DIL = DLoc.get(); 
                do {
                    unsigned ln = DIL->getLine();
                    unsigned col = DIL->getColumn(); 
                    DIScope *DIS = DIL->getScope(); 
                    std::string file = (DIS) ? DIS->getFilename().str() : "invalid filename";

                    LLVM_DEBUG(dbgs() << "!DILocation: " << file << ":" << ln << ":" << col);
                    if (DISubprogram *DIP = dyn_cast<DISubprogram>(DIS)) {
                        LLVM_DEBUG(dbgs() << "\tsubprogram: " << DIP->getName()); 
                    }
                    DILocation *DILInlinedAt = DIL->getInlinedAt();
                    if (DILInlinedAt) {
                        LLVM_DEBUG(dbgs() << "\n\t\t\tinlined at: "); 
                    }
                    DIL = DILInlinedAt;

                } while (DIL);
            }
        }
    }
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
        auto &FAM = AM.getResult<FunctionAnalysisManagerModuleProxy>(M).getManager();
        auto getLI = [&](Function &F) -> LoopInfo& {
            return FAM.getResult<LoopAnalysis>(F);
        };
        auto getTI = [&](Function &F) -> TaskInfo& {
            return FAM.getResult<TaskAnalysis>(F);
        };
        const ParallelRegion &PR = AM.getResult<ParallelRegionAnalysis>(M);
        ParallelForDebugInfoImpl(M, PR).run(getLI, getTI);
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
        // the same pipeline extension point as instrumentation pass
        PB.registerTapirLateEPCallback([&](ModulePassManager &MPM, auto) {
            MPM.addPass(ParallelForDebugInfo());
            return true;
        });

    };

    return {LLVM_PLUGIN_API_VERSION, PBBSV2_NAME, "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getParallelRegionStatsPluginInfo();
}