#include "llvm/Pass.h"
#include "llvm/IR/PassManager.h"
#include "llvm/ADT/SCCIterator.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/SmallSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/Analysis/CallGraph.h"
#include "llvm/Analysis/CallGraphSCCPass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/CFG.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/ULI/ParallelRegion.h"
#include "llvm/Transforms/Scalar/SimplifyCFG.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

#define LAZYD_STRATS_NAME "lazyd-strategy-lowering"
#define DEBUG_TYPE LAZYD_STRATS_NAME

namespace {

//==== LazyD Stategy Intrinsic Lowering main implementation ================
struct LazyDStrategyLoweringImpl {
    LazyDStrategyLoweringImpl(Function &F, const ParallelRegion &PR) 
        : F(F), PR(PR) {}
    bool run();
private:
    Function &F;
    const ParallelRegion &PR;
};

bool LazyDStrategyLoweringImpl::run() {
    Module *M = F.getParent();
    LLVMContext &ctx = F.getContext();
    IRBuilder<> builder(ctx);
    bool Changed = false;

    // iteration variable
    CallInst *CI = nullptr;
    Function *Intrinsic = nullptr;

    // collector of __builtin_uli_lazyd_strategy intrinsics
    SmallVector<Instruction *, 8> trash;
    for (auto I = inst_begin(F), E = inst_end(F); I != E; ++I) {
        if ((CI = dyn_cast<CallInst>(&*I))
            && (Intrinsic = CI->getCalledFunction())
            && (Intrinsic->getIntrinsicID() == Intrinsic::uli_lazyd_strategy)) 
        {

            F.dump();
            // builder.SetInsertPoint(&*I);
            // Value *STATIC_STRATEGY_PTR = CI->getArgOperand(0);
            // assert(STATIC_STRATEGY_PTR && "Found invalid __builtin_uli_lazyd_strategy intrinsic!");
            
            // /// DEBUG: 
            // STATIC_STRATEGY_PTR->dump();
            // STATIC_STRATEGY_PTR->getType()->dump();
            // outs() << '\n';
            // /////////
            
            // // get static ParallelRegion state
            // int static_strategy = 0;
            // PRState prs = PR[F];
            // switch (prs) {
            //     case PRState::DefinitelyEF: {
            //         static_strategy = 0;
            //         break;
            //     }
            //     case PRState::DefinitelyDAC: {
            //         static_strategy = 1;
            //         break;
            //     }
            //     default: {
            //         static_strategy = 2;
            //         break;
            //     }
            // }

            // // AllocaInst *AllocaI = builder.CreateAlloca(Type::getInt32Ty(ctx));
            // Value *STATIC_STRATEGY = ConstantInt::get(Type::getInt32Ty(ctx), static_strategy);

            // builder.CreateStore(STATIC_STRATEGY, STATIC_STRATEGY_PTR);


        }
    }

    // safely remove all __builtin_uli_lazyd_strategy intrinsics
    for (auto *I : trash) {
        I->eraseFromParent();
    }
    return Changed;
}

//==== LazyD Strategy Intrinsic Lowering pass boilerplate code ============== 
struct LazyDStrategyLoweringPass : public PassInfoMixin<LazyDStrategyLoweringPass> {
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        // retrive ParallelRegion Analysis result
        const ParallelRegion &PR = AM.getResult<ParallelRegionAnalysis>(M);
        // run lowering pass on each function in the module
        SmallVector<Function *, 8> workList;    
        for (Function &F : M) {
            workList.push_back(&F);
        }

        bool Changed = false;
        for (Function *F : workList) {
            Changed |= LazyDStrategyLoweringImpl(*F, PR).run();
        }
        if (Changed) {
            return PreservedAnalyses::none();
        } else {
            return PreservedAnalyses::all();
        }
    }
};

} // end namespace

//==== register and insert LazyD Strategy 
PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        // auto& PIC = *PB.getPassInstrumentationCallbacks();
        // PIC.registerBeforePassCallback([&](StringRef &PassID, auto ) {
        //     if (PassID == )
        // });
        // register before inlining 
        PB.registerPipelineStartEPCallback([&](ModulePassManager &MPM, auto ) {
            MPM.addPass(LazyDStrategyLoweringPass());
            // schedule mem2reg pass to perform constant prop that moves lazyd_strategy to branch condition
            MPM.addPass(createModuleToFunctionPassAdaptor(PromotePass()));
            // schedule SimplifyCFGPass to clean up unncessary branching after intrinsic
            MPM.addPass(createModuleToFunctionPassAdaptor(SimplifyCFGPass()));
        });
        
    };
    return {LLVM_PLUGIN_API_VERSION, LAZYD_STRATS_NAME, "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}