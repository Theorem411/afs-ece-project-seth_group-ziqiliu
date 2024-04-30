#include "llvm/Transforms/ULI/ParallelRegion.h"
#include "llvm/Transforms/Utils.h"
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

#define INLINER_PASS "inline-prr"
#define DEBUG_TYPE INLINER_PASS

namespace {

struct InlinerPrrPrinterImpl {
    InlinerPrrPrinterImpl() {}
    
    void run(Module &M, const ParallelRegion &PR) {    
        for (Function &F : M) {
            outs() << F.getName() << " : " << printPRState(PR[&F]) << '\n';
        }
    }

private: 
};

struct InlinerPrrPrinter : public PassInfoMixin<InlinerPrrPrinter> {
    explicit InlinerPrrPrinter() {}

    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        const ParallelRegion &PR = AM.getResult<ParallelRegionAnalysis>(M);
        InlinerPrrPrinterImpl().run(M, PR);
        return PreservedAnalyses::all();
    }
};

} // end namespace

PassPluginLibraryInfo getInlinerPrrPrinterPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        PB.registerPipelineParsingCallback(
            [](StringRef name, ModulePassManager &PM, auto) {
                if (name == INLINER_PASS) {
                    PM.addPass(InlinerPrrPrinter());
                    return true;
                }
                return false;
            }
        );
    };
    return {LLVM_PLUGIN_API_VERSION, INLINER_PASS, "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getInlinerPrrPrinterPluginInfo();
}