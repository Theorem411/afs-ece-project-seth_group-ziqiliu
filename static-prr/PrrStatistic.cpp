#include "llvm/Transforms/ULI/ParallelRegion.h"
#include "llvm/Transforms/Utils.h" // for LoopSimplifyID
#include "llvm/Pass.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/JSON.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include <utility> 

using namespace llvm;

#define PRR_NAME "prr-stats"
#define DEBUG_TYPE PRR_NAME

STATISTIC(NumFn, 
          "NumFn                "
          "number of functions in module");
STATISTIC(NumDefinitelyDAC,
          "NumDefinitelyDAC     "
          "number of functions that are definitely called within a parallel "
          "region, and thus must adopt DAC as its outline strategy.");
STATISTIC(NumDefinitelyEF,
          "NumDefinitelyEF      "
          "number of functions that are definitely called within a serial "
          "region, and thus can adopt EF as its outline strategy.");
STATISTIC(NumBoth, 
          "NumBoth              "
          "number of functions that are witnessed to be called in "
          "both parallel and serial region, and thus must use a "
          "global counter to decide its outline stategy.");
STATISTIC(NumUntouched,
          "NumUntouched         "
          "number of functions untouched by the end of this call-graph analysis,"
          " usually root function in the callgraph.");
// STATISTIC(NumCallback, 
//           "NumCallback          "
//           "number of callback functions");
STATISTIC(NumIndirectCall, 
          "NumIndirectCall      "
          "number of indirect callsites");
STATISTIC(NumFuncPtrAsArg, 
          "NumFuncPtrAsArg      "
          "Number of callbase that's suspicious of callback pattern");
STATISTIC(NumPFor, 
          "NumPFor              "
          "number of parallel-for loops");
STATISTIC(NumPForTopLevel, 
          "NumPForTopLevel      "
          "number of top-level pfor loops");
STATISTIC(NumPForDefinitelyDAC, 
          "NumPForDefinitelyDAC "
          "number of parallel-for that doesn't need counter-assisted outlining"
          " because it's definitely DAC");
STATISTIC(NumPForTopLevelDefinitelyDAC,
          "NumPForTopLevelDefinitelyDAC  "
          "number of top-level pfor that doesn't need counter-assisted outlining"
          " because it's definitely DAC");
STATISTIC(NumPForDefinitelyEF, 
          "NumPForDefinitelyEF  "
          "number of parallel-for that doesn't need counter-assisted outlining"
          " because it's definitely EF");
STATISTIC(NumPForTopLevelDefinitelyEF,
          "NumPForTopLevelDefinitelyEF  "
          "number of top-level pfor that doesn't need counter-assisted outlining"
          " because it's definitely EF");
STATISTIC(NumPForBoth, 
          "NumPForBoth          "
          "number of parallel-for that will need a global counter to choose "
          "outlining strategy because it can be reached by both parallel and "
          "and serial region control-flow path");
STATISTIC(NumPForTopLevelBoth,
          "NumPForTopLevelBoth  "
          "number of top-level pfor that will need a global counter to choose "
          "outlining strategy because it can be reached by both parallel and "
          "and serial region control-flow path");
STATISTIC(NumPForUntouched, 
          "NumPForUntouched    "
          "number of pfor that are still untouched by the dataflow analysis"
          ". DEBUG: this number should be 0!!!");

cl::opt<std::string> TestName(
    "test", 
    cl::init("default"), 
    cl::Hidden,
    cl::desc("name of benchmark test case")
);

namespace {

struct PRRStatsImpl {
    PRRStatsImpl(Module &M, const ParallelRegion &PR) : M(M), PR(PR) {}
    // main functionality
    void run(std::function<LoopInfo &(Function &)>, 
                std::function<TaskInfo &(Function &)>);
private:
    // collect statistics and prepare csv flush stringmaps from ParallelRegion
    void collect(std::function<LoopInfo &(Function &)>, 
                std::function<TaskInfo &(Function &)>);
    // flush statistics to json file
    void flushJson() const;
    // flush func, block, loop level prstates to csv
    void flushCSV() const;
private: 
    Module &M;
    const ParallelRegion &PR;

    using StringPairTy = std::pair<StringRef, StringRef>;
    using StringMapTy = StringMap<StringRef>;
    using StringMapMapTy = StringMap<SmallVector<StringPairTy>>; // use Vector to preserve block print order 
    StringMapTy FuncStringMap;
    StringMapMapTy LoopStringMap;
    StringMapMapTy BlockStringMap;
};

void PRRStatsImpl::run(std::function<LoopInfo &(Function &)> getLI, 
                std::function<TaskInfo &(Function &)> getTI) {
    // collect stats & update stringmaps
    collect(getLI, getTI);
    // output results: stats & csv
    flushJson();
    flushCSV();
}

void PRRStatsImpl::collect(std::function<LoopInfo &(Function &)> getLI, 
                            std::function<TaskInfo &(Function &)> getTI) {
    // update function statistics & prepare stringmap for csv flush
    for (Function &F : M) {
        if (F.isDeclaration()) 
            continue;
        // udpate function count
        NumFn++;

        // update function stringmap
        StringRef FName = F.getName();
        PRState FState = PR[&F];
        FuncStringMap[FName] = printPRState(FState);

        // update function state statistics
        switch (FState) {
            case PRState::DefinitelyDAC: {
                ++NumDefinitelyDAC;
                break;
            }
            case PRState::DefinitelyEF: {
                ++NumDefinitelyEF;
                break;
            }
            case PRState::Both: {
                ++NumBoth;
                break;
            }
            case PRState::Untouched: {
                ++NumUntouched;
                break;
            }
        }

        // update loop state statistics
        TaskInfo &TI = getTI(F);
        LoopInfo &LI = getLI(F);
        if (TI.isSerial()) {
            continue;
        }
        for (Loop *TopLevelLoop : LI) {
            for (Loop *L : post_order(TopLevelLoop)) {
                if (llvm::getTaskIfTapirLoopStructure(L, &TI)) {
                    // update tapir pfor count
                    ++NumPFor;

                    // udpate loop stringmap
                    StringRef LName = L->getHeader()->getName();
                    PRState LState = PR[L];
                    LoopStringMap[FName].push_back({LName, printPRState(LState)});
                    
                    // update toplevel/nested pfor state stats
                    if (L == TopLevelLoop) {
                        ++NumPForTopLevel;
                    } 
                    switch (LState) {
                        case PRState::DefinitelyDAC: {
                            ++NumPForDefinitelyDAC;
                            ++NumPForTopLevelDefinitelyDAC; 
                            break;
                        } 
                        case PRState::DefinitelyEF: {
                            ++NumPForDefinitelyEF;
                            ++NumPForTopLevelDefinitelyEF;
                            break;
                        } 
                        case PRState::Both: {
                            ++NumPForBoth;
                            ++NumPForTopLevelBoth;
                            break;
                        } 
                        case PRState::Untouched: {
                            ++NumPForUntouched;
                            break;
                        } 
                    }
                }
            }
        }

        // no block statistics, prepare block stringmap
        for (auto &BB : F) {
            StringRef BName = BB.getName();
            PRState BState = PR[&BB];
            BlockStringMap[FName].push_back({BName, printPRState(BState)});
        }
    }
}

void PRRStatsImpl::flushJson() const {
    json::Object jsonObj;
    jsonObj["NumFn"] = static_cast<uint64_t>(NumFn);
    jsonObj["NumDefinitelyDAC"] = static_cast<uint64_t>(NumDefinitelyDAC);
    jsonObj["NumDefinitelyEF"] = static_cast<uint64_t>(NumDefinitelyEF);
    jsonObj["NumBoth"] = static_cast<uint64_t>(NumBoth);
    jsonObj["NumUntouched"] = static_cast<uint64_t>(NumUntouched);
    // jsonObj["NumCallback"] = static_cast<uint64_t>(NumCallback);
    jsonObj["NumFuncPtrAsArg"] = static_cast<uint64_t>(NumFuncPtrAsArg);

    jsonObj["NumPFor"] = static_cast<uint64_t>(NumPFor);
    jsonObj["NumPForDefinitelyDAC"] = static_cast<uint64_t>(NumPForDefinitelyDAC);
    jsonObj["NumPForDefinitelyEF"] = static_cast<uint64_t>(NumPForDefinitelyEF);
    jsonObj["NumPForBoth"] = static_cast<uint64_t>(NumPForBoth);
    jsonObj["NumPForUntouched"] = static_cast<uint64_t>(NumPForUntouched);

    jsonObj["NumPForTopLevel"] = static_cast<uint64_t>(NumPForTopLevel);
    jsonObj["NumPForTopLevelDefinitelyDAC"] = static_cast<uint64_t>(NumPForTopLevelDefinitelyDAC);
    jsonObj["NumPForTopLevelDefinitelyEF"] = static_cast<uint64_t>(NumPForTopLevelDefinitelyEF);
    jsonObj["NumPForTopLevelBoth"] = static_cast<uint64_t>(NumPForTopLevelBoth);

    //
    json::Value jsonVal = std::move(jsonObj);

    // output to file
    std::string FileName = TestName + ".json";
    outs() << "\n------\nFileName: " << FileName << "\n";
    std::error_code EC;
    raw_fd_ostream file(FileName, EC);
    if (EC) {
        errs() << "Error opening file: " << EC.message() << "\n";
        return;
    }
    file << formatv("{0:2}", jsonVal);
}

void PRRStatsImpl::flushCSV() const {
    // funcfile
    std::string FuncFileName = TestName + ".func.csv";
    outs() << "\n------\nFileName: " << FuncFileName << "\n";
    std::error_code EC1;
    raw_fd_ostream funcfile(FuncFileName, EC1);
    if (EC1) {
        errs() << "Error opening file: " << EC1.message() << "\n";
        return;
    }

    funcfile << "funcname,state\n";
    for (const auto &it : FuncStringMap) {
        // function names
        StringRef FuncName = it.first();
        // func static states
        StringRef State = it.second;
        
        funcfile << FuncName << "," << State << "\n";
    }

    // loopfile
    std::string LoopFileName = TestName + ".loop.csv";
    outs() << "\n------\nFileName: " << LoopFileName << "\n";
    std::error_code EC2;
    raw_fd_ostream loopfile(LoopFileName, EC2);
    if (EC2) {
        errs() << "Error opening file: " << EC2.message() << "\n";
        return;
    }
    
    loopfile << "funcname,loopname,state\n";
    for (const auto &it : LoopStringMap) {
        // function names
        StringRef FuncName = it.first();
        // loop static states
        const SmallVector<std::pair<StringRef, StringRef>>& L2S = it.second;
        for (auto &it : L2S) {
            // loop name
            StringRef LoopName = it.first;
            // loop state
            StringRef State = it.second;
            // output row
            loopfile << FuncName << "," << LoopName << "," << State << '\n';
        }
    }

    // block file
    std::string BlockFileName = TestName + ".block.csv";
    outs() << "\n------\nFileName: " << BlockFileName << '\n';
    std::error_code EC3;
    raw_fd_ostream blockfile(BlockFileName, EC3);
    if (EC3) {
        errs() << "Error opening file: " << EC3.message() << '\n';
        return;
    }

    blockfile << "funcname,blockname,state\n";
    for (const auto &it : BlockStringMap) {
        // function names
        StringRef FuncName = it.first();
        // block static states
        const SmallVector<std::pair<StringRef, StringRef>> &B2S = it.second;
        for (const auto &it : B2S) {
            // block name
            StringRef BlockName = it.first;
            // block state
            StringRef State = it.second;
            // output row 
            blockfile << FuncName << "," << BlockName << "," << State << '\n';
        }
    }
}

//============ New Pass Manager Module Pass ======================
struct ParallelRegionStats : public PassInfoMixin<ParallelRegionStats> {
    explicit ParallelRegionStats() {};

    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        auto &FAM = AM.getResult<FunctionAnalysisManagerModuleProxy>(M).getManager();
        auto getLI = [&](Function &F) -> LoopInfo& {
            return FAM.getResult<LoopAnalysis>(F);
        };
        auto getTI = [&](Function &F) -> TaskInfo& {
            return FAM.getResult<TaskAnalysis>(F);
        };

        const ParallelRegion &PR = AM.getResult<ParallelRegionAnalysis>(M);

        PRRStatsImpl(M, PR).run(getLI, getTI);

        return PreservedAnalyses::all();
    }
};

//============ Legacy Pass Manager Module Pass ======================
struct ParallelRegionStatsWrapperPass : public ModulePass {
    static char ID;
    explicit ParallelRegionStatsWrapperPass() : ModulePass(ID) {}
    ~ParallelRegionStatsWrapperPass() {}

    bool runOnModule(Module &M) override {
        auto getLI = [&](Function &F) -> LoopInfo& {
            return getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
        };
        auto getTI = [&](Function &F) -> TaskInfo& {
            return getAnalysis<TaskInfoWrapperPass>(F).getTaskInfo();
        };
        
        ParallelRegion PR = getAnalysis<ParallelRegionWrapperPass>().getParallelRegion();

        PRRStatsImpl(M, PR).run(getLI, getTI);

        return false;
    }

    void getAnalysisUsage(AnalysisUsage &AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
        AU.addRequired<TaskInfoWrapperPass>();
        AU.addRequired<ParallelRegionWrapperPass>();
        AU.addRequiredID(LoopSimplifyID); // must have preheader
        AU.setPreservesAll();
    }
};

} // end namespace

//============ Legacy Module Pass registration ======================
char ParallelRegionStatsWrapperPass::ID = 0;

static RegisterPass<ParallelRegionStatsWrapperPass> X(
    PRR_NAME,
    "print results of ParallelRegionAnalysis in json and csv format",
    false, 
    false
);

//============ New Pass Manager Library Plugin ======================
PassPluginLibraryInfo getParallelRegionStatsPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        // register printer pass for opt's -passes="prr-stats"
        PB.registerPipelineParsingCallback(
            [](StringRef Name, ModulePassManager &PM, auto ) {
                if (Name == PRR_NAME) {
                    PM.addPass(ParallelRegionStats());
                    return true;
                }
                return false;
            }
        );

        // register for clang's -fpass-plugin=prr-stats
        // PB.registerTapirLateEPCallback([&](ModulePassManager &MPM, auto) {
        //     MPM.addPass(ParallelRegionStats());
        //     return true;
        // });
    };

    return {LLVM_PLUGIN_API_VERSION, PRR_NAME, "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getParallelRegionStatsPluginInfo();
}

