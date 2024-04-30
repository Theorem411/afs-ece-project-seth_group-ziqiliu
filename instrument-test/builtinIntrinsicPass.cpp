#include "llvm/PassRegistry.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/JSON.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/PassManager.h"
#include "llvm/ADT/SmallSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/PostOrderIterator.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/CallingConv.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/CFG.h"
#include "llvm/Analysis/TapirTaskInfo.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Transforms/Utils/TapirUtils.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils.h" // for LoopSimplifyID
#include "llvm/Transforms/Utils/ValueMapper.h"

#define BUILDT_IN_NAME "instrument-builtin"
#define DEBUG_TYPE BUILDT_IN_NAME

using namespace llvm;

namespace {
    
struct BuiltInInstrumentImpl {
    BuiltInInstrumentImpl() {}
    bool run(Function &F);
private:
};

bool BuiltInInstrumentImpl::run(Function &F) {
    Module *M = F.getParent();
    LLVMContext &ctx = F.getContext();
    IRBuilder<> builder(ctx);
    bool Changed = false;

    // iteration variables
    CallInst *CI = nullptr;
    Function *Intrinsic = nullptr;

    // LLVM Types constructors
    IntegerType *I32 = IntegerType::getInt32Ty(ctx);
    IntegerType *I64 = IntegerType::getInt64Ty(ctx);
    Type *I8Ptr = PointerType::get(Type::getInt8Ty(ctx), 0);
    FunctionType *FnTy = FunctionType::get(
        /*Result*/Type::getVoidTy(ctx),
        /*Params*/{I8Ptr, I8Ptr, I64, I64, I32},
        /*isVarArg*/false
    );
    PointerType *FnPtrTy = PointerType::get(FnTy, 0);

    Value *idx_zero = ConstantInt::get(Type::getInt64Ty(ctx), 0);

    // file and line number using DISubprogram of parent function F
    DISubprogram *Subprogram = F.getSubprogram();
    if (!Subprogram) {
        errs() << F.getName() << " has no DISubprogram!\n";
        return false;
    }
    StringRef subpNameStr = Subprogram->getName();
    StringRef subpLinkageNameStr = Subprogram->getLinkageName();

    // collect list of __builtin_uli_lazyd_inst intrinsic for replacement
    SmallVector<Instruction *, 8> Builtin_Uli_Lazyd_Insts;
    for (auto I = inst_begin(F), E = inst_end(F); I != E; ++I) {
        if ((CI = dyn_cast<CallInst>(&*I))
            && (Intrinsic = CI->getCalledFunction())
            && (Intrinsic->getIntrinsicID() == Intrinsic::uli_lazyd_inst)) 
        {
            // Found Intrinsic "__builtin_uli_lazyd_inst" callsite
            // outs() << "found __builtin_uli_lazyd_inst callsite in " << F.getName() << '\n';
            builder.SetInsertPoint(&*I);
            // Extract lazydIntrumentLoop function
            // %0 = bitcast i8* %fnptr to void (i8*, i64, i64, i32)*
            Value *FnPtr= CI->getArgOperand(0);
            assert(FnPtr && "fail to retrieve lazydIntrumentLoop from __builtin_uli_lazyd_inst first arg!");
            Value *Callee = builder.CreateBitCast(
                /*Value*/FnPtr, 
                /*DestTy*/FnPtrTy,
                /*Twine:Name*/"instloop"
            );
            // outs() << "  bitcast np!\n";
            // first operand __builtin_uli_lazyd_inst is placeholder
            // Value *FileAndLineNumber = CI->getArgOperand(1); // value: nullptr
            
            GlobalVariable *LinkageNameGlobStr = builder.CreateGlobalString(
                subpLinkageNameStr, 
                "file_and_line_number", 
                0 /* Default AddressSpace */, 
                nullptr /* Default Module */
            );

            Value *LinkageName = builder.CreateInBoundsGEP(
                /*Ty*/LinkageNameGlobStr->getValueType(),
                /*Ptr*/LinkageNameGlobStr,
                /*IdxList*/{idx_zero, idx_zero}
            );

            GlobalVariable *FileAndLineGlobStr = builder.CreateGlobalString(
                subpNameStr, 
                "file_and_line_number", 
                0 /* Default AddressSpace */, 
                nullptr /* Default Module */
            );

            Value *FileAndLine = builder.CreateInBoundsGEP(
                /*Ty*/FileAndLineGlobStr->getValueType(),
                /*Ptr*/FileAndLineGlobStr,
                /*IdxList*/{idx_zero, idx_zero}
            );

            // extract other operands of __builtin_uli_lazyd_inst
            Value *TripCount = CI->getArgOperand(2);
            Value *GranSize = CI->getArgOperand(3);
            Value *Depth = CI->getArgOperand(4);
            assert(LinkageName 
                && FileAndLine
                && TripCount 
                && GranSize 
                && Depth 
                && "__builtin_uli_lazyd_inst has null argument!");
            
            // call void %0(i8* file_and_line_number, i64 trip_count, i64 grain_size, i32 depth)
            builder.CreateCall(
                /*FTy*/FnTy, 
                /*Callee*/Callee,
                /*Args*/{LinkageName, FileAndLine, TripCount, GranSize, Depth}
            );
            // outs() << "  call to lazydIntrumentLoop np!\n";
            // delete original intrinsic later
            Builtin_Uli_Lazyd_Insts.push_back(&*I);
            Changed = true;
        }
    }
    // delete replaced intrinsics
    for (auto *I : Builtin_Uli_Lazyd_Insts) {
        I->eraseFromParent();
    }
    // outs() << "erased all __builtin_uli_lazyd_inst in " << F.getName() << "!\n";
    return Changed;
}

struct BuiltInInstrumentPass : public PassInfoMixin<BuiltInInstrumentPass> {
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        // outs() << "<><><><> at least BuiltInInstrumentPass is run! <><><><>\n";
        SmallVector<Function *, 8> WorkList;
        for (Function &F : M) {
            if (!F.empty() && !F.isDeclaration())
                WorkList.push_back(&F);
        }

        bool Changed = false;
        for (Function *F : WorkList) {
            Changed |= BuiltInInstrumentImpl().run(*F);
        }

        if (Changed)
            return PreservedAnalyses::none();
        return PreservedAnalyses::all();
    }
};

} // end namespace 

PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        PB.registerTapirLoopEndEPCallback([&](ModulePassManager &MPM, auto) {
            MPM.addPass(BuiltInInstrumentPass());
            return true;
        });
    };
    return {LLVM_PLUGIN_API_VERSION, BUILDT_IN_NAME, "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}
