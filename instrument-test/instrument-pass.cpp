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
// #include "llvm/Transforms/Utils/LoopSimplify.h"

#define INSTR_NAME "instrument-test"
#define DEBUG_TYPE INSTR_NAME

using namespace llvm;

STATISTIC(NumTaskNoSync, "number of TapirTask that doesn't have sync instruction.");

namespace {

struct InstrumentTestImpl {
    InstrumentTestImpl(Function &F, DominatorTree &DT, LoopInfo &LI, TaskInfo &TI) 
        : F(F), DT(DT), LI(LI), TI(TI) {}
    bool runOnFunction(FunctionCallee &SOURCE_DEBUG_INFO);
    bool runOnLoop(Loop *L, Value *FuncNameChar, FunctionCallee &CHOICE);
    bool runOnTask(Task *T, FunctionCallee &RC_BUMP_UP, FunctionCallee &RC_BUMP_DOWN);
    bool run();
private: 
    void collectTapirLoop(SmallVector<Loop *> &workList) {
        if (TI.isSerial()) 
            // function contains no pfor
            return;

        for (Loop *TopLevelLoop : LI) {
            for (Loop *L : post_order(TopLevelLoop)) {
                Task *T = getTaskIfTapirLoopStructure(L, &TI);
                if (!T) 
                    continue;
                assert(L->isLoopSimplifyForm() && "found loops that's not loop simplified form!");
                workList.push_back(L);
            }
        }
    }

    void collectTaskExits(Task *T, SmallSet<BasicBlock *, 4> &TaskExits) {
        assert(T && "collectTaskExit encounter null Task!");
        for (Spindle *S : T->getSpindles()) {
            for (BasicBlock* B : S->blocks()) {
                if (T->isTaskExiting(B)) {
                    for (auto S = succ_begin(B); S != succ_end(B); ++S) {
                        TaskExits.insert(*S);
                    }
                }
            }
        }
    }

    SyncInst *findSync(Task *T) {
        // find the sync instruction specific to this Task
        SyncInst *sync = nullptr;
        for (Spindle *S : T->getSpindles()) {
            if (S->isSync()) {
                // DEBUG: FILL IN LATER!!
                
            }
        }
        return sync;
    }


private: 
    Function& F;
    LoopInfo& LI;
    DominatorTree& DT;
    TaskInfo& TI;
    // map from task to sync inst; only task region with sync will be instrumented
    DenseMap<const Task *, const Instruction *> TaskToSync;
};

/** InstrumentTestPassLegacy: 
 * add the following instrumentation code for a test file: 
*/
bool InstrumentTestImpl::runOnLoop(Loop *L, Value *FuncNameChar, FunctionCallee &CHOICE) {
    if (!L->isLoopSimplifyForm()) {
        errs() << "\n<><><> runOnLoop encounter loop that's not loop-simplified form! <><><>\n";
        return false;
    }
    BasicBlock *PH = L->getLoopPreheader();
    assert(PH && "runOnLoop encounter loop without preheaders");

    // insert call to _choice at header
    BasicBlock *H = L->getHeader();
    // IRBuilder<> Builder(PH->getFirstNonPHIOrDbgOrLifetime());
    IRBuilder<> Builder(PH->getTerminator());

    GlobalVariable *LoopName = Builder.CreateGlobalString(
        H->getName(), 
        "loopname", 
        0 /* Default AddressSpace */, 
        nullptr /* Default Module */
    );
    /// ===============================================================
    LLVMContext &Ctx = PH->getModule()->getContext();
    Value *idx_zero = ConstantInt::get(Type::getInt64Ty(Ctx), 0);
    Value *LoopNameChar = Builder.CreateInBoundsGEP(
        /*Ty*/LoopName->getValueType(),
        /*Ptr*/LoopName,
        /*IdxList*/{idx_zero, idx_zero}
    );
    
    /// ===============================================================
    // ArrayRef<Value *> Args({FuncNameChar, LoopNameChar});
    Builder.CreateCall(CHOICE, {FuncNameChar, LoopNameChar});

    // DEBUG: don't uncomment the following code!
    // call->setCallingConv(llvm::CallingConv::C);
    return true;
}

bool InstrumentTestImpl::runOnTask(Task *T, FunctionCallee &RC_BUMP_UP, FunctionCallee &RC_BUMP_DOWN) {
    if (!T->getDetach()) {
        // skip root task
        return false;
    }
    // at the start of each task entry, bump up globvar RC
    BasicBlock *TaskEntry = T->getEntry();
    if (!TaskEntry) {
        LLVM_DEBUG(dbgs() << "\n<><><> Found Task without entry! <><><>\n");
        return false;
    }
    LLVM_DEBUG(dbgs() << "  -- instrument task entry...\n");
    IRBuilder<> Builder(T->getDetach()); // TaskEntry->getFirstNonPHIOrDbgOrLifetime()

    // ===== Create RC_BUMP_UP ====================
    CallInst *call = Builder.CreateCall(RC_BUMP_UP);

    // DEBUG: don't uncomment the following line 
    // call->setCallingConv(llvm::CallingConv::C);

    // before exit of task region, bump down globvar RC
    LLVM_DEBUG(dbgs() << "  -- instrument task exits...\n");
    SmallSet<BasicBlock *, 4> TaskExits;
    collectTaskExits(T, TaskExits);
    for (BasicBlock *E : TaskExits) {


        LLVM_DEBUG(dbgs() << "     on task exit block " << E->getName() << ":\n");
        IRBuilder<> Builder(E->getFirstNonPHIOrDbgOrLifetime());
        // =============== Crate RC_BUMP_DOWN ============
        CallInst *call = Builder.CreateCall(RC_BUMP_DOWN);


        // DEBUG: don't uncomment the following line!
        // call->setCallingConv(llvm::CallingConv::C);
    }

    return true;
}

bool InstrumentTestImpl::runOnFunction(FunctionCallee &SOURCE_DEBUG_INFO) {
    // check !DISubprogram for hint of parallel_for 
    DISubprogram *SP = F.getSubprogram();
    if (!SP) {
        errs() << F.getName() << " make sure compiled with -gdwarf-2!\n";
        return false;
    }
    StringRef spname = SP->getName();
    if(!spname.startswith(StringRef("parallel_for<(lambda at "))) 
        return false;
    
    
    BasicBlock &Entry = F.getEntryBlock();
    IRBuilder<> Builder(Entry.getTerminator());
    // two input as global strings
    GlobalVariable *SPName = Builder.CreateGlobalString(
        spname,
        "spname",
        0 /* Default AddressSpace */, 
        nullptr /* Default Module */
    );
    GlobalVariable *FuncName = Builder.CreateGlobalString(
        F.getName(),
        "funcname",
        0 /* Default AddressSpace */, 
        nullptr /* Default Module */
    );
    // prepare arguments 
    LLVMContext &Ctx = F.getParent()->getContext();
    Value *idx_zero = ConstantInt::get(Type::getInt64Ty(Ctx), 0);
    Value *SPNameChar = Builder.CreateInBoundsGEP(
        /*Ty*/SPName->getValueType(),
        /*Ptr*/SPName,
        /*IdxList*/{idx_zero, idx_zero}
    );
    Value *FuncNameChar = Builder.CreateInBoundsGEP(
        /*Ty*/FuncName->getValueType(),
        /*Ptr*/FuncName,
        /*IdxList*/{idx_zero, idx_zero}
    );
    Builder.CreateCall(SOURCE_DEBUG_INFO, {FuncNameChar, SPNameChar});

    return true;
}   

bool InstrumentTestImpl::run() {
    LLVM_DEBUG(dbgs() << "\nrunOnFunction(" << F.getName() << ")...\n");
    /** precompute code */
    // go through all tapir loop find their sync instruction
    // go through each loop preheader, add a 
    LLVM_DEBUG(dbgs() << "collect TaskToSync...\n");
    for (Task *T : TI) {
        if (T->getDetach()) {
            // for non-root task only
            SyncInst *SyncI = findSync(T);
            if (!SyncI) {
                ++NumTaskNoSync;
                continue;
            }
            TaskToSync[T] = SyncI;
        }
    }
    /** add instrumentation code */
    Module *M = F.getParent();
    LLVMContext &Ctx = M->getContext();
    // create function name as a global variable
    IRBuilder<> Builder(&F.getEntryBlock());
    // outs() << "creating global name string for " << F.getName() << "...\n";
    GlobalVariable *FuncName = Builder.CreateGlobalString(
        F.getName(),
        "funcname",
        0 /* Default AddressSpace */, 
        nullptr /* Default Module */
    );
    Value *idx_zero = ConstantInt::get(Type::getInt64Ty(Ctx), 0);
    // outs() << "  convert global string " << F.getName() << " to Value *...\n";
    Value *FuncNameChar = Builder.CreateInBoundsGEP(
        /*Ty*/FuncName->getValueType(),
        /*Ptr*/FuncName,
        /*IdxList*/{idx_zero, idx_zero}
    );

    // create extern declaration of _incr_dac & _incr_ef & _rc_bump_up & _rc_bump_down
    IntegerType *I64Ty = IntegerType::getInt64Ty(Ctx);
    Type *I8PtrTy = PointerType::get(Type::getInt8Ty(Ctx), 0);

    FunctionCallee CHOICE = M->getOrInsertFunction(
        "_choice",
        FunctionType::get(
            /*Result*/Type::getVoidTy(Ctx), 
            /*Params*/ArrayRef<Type *>({I8PtrTy, I8PtrTy}),
            /*isVarArg*/false
        )
    );

    FunctionCallee RC_BUMP_UP = M->getOrInsertFunction(
        "_rc_bump_up", 
        FunctionType::get(
            /*Result*/Type::getVoidTy(Ctx), 
            /*isVarArg*/false
        )
    );

    FunctionCallee RC_BUMP_DOWN = M->getOrInsertFunction(
        "_rc_bump_down",
        FunctionType::get(
            /*Result*/Type::getVoidTy(Ctx), 
            /*isVarArg*/false
        )
    );

    FunctionCallee SOURCE_DEBUG_INFO = M->getOrInsertFunction(
        "_source_debug_info",
        FunctionType::get(
            /*Result*/Type::getVoidTy(Ctx),
            /*Params*/ArrayRef<Type *>({I8PtrTy, I8PtrTy}),
            /*isVarArg*/false
        )
    );
    
    // run through all task, instrument with region-count updates
    bool Changed = false;
    LLVM_DEBUG(dbgs() << "add instrumentation to all task...\n");
    for (Task *T : TI) {
        // for non-root task only
        LLVM_DEBUG(dbgs() << "  runOnTask started with:\n");
        // T->getDetach()->dump();

        Changed |= runOnTask(T, RC_BUMP_UP, RC_BUMP_DOWN);
    }

    // for each tapir loop, instrument with _choice split 
    LLVM_DEBUG(dbgs() << "add instrumentation to all loop...\n");
    SmallVector<Loop *> workList;
    collectTapirLoop(workList);

    while (!workList.empty()) {
        Loop *L = workList.pop_back_val();
        LLVM_DEBUG(dbgs() << "  runOnLoop:" << L->getLoopPreheader()->getName() << "\n");
        Changed |= runOnLoop(L, FuncNameChar, CHOICE); 
    }

    // instrument all parallel_for spec func entry
    Changed |= runOnFunction(SOURCE_DEBUG_INFO);
    return Changed;
}

struct InstrumentTestPassLegacy : public FunctionPass {
    static char ID;
    explicit InstrumentTestPassLegacy() : FunctionPass(ID) {}
    ~InstrumentTestPassLegacy() {
        // toJSON();
    }

    bool runOnFunction(Function &F) override {
        auto &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
        auto &TI = getAnalysis<TaskInfoWrapperPass>().getTaskInfo();
        auto &DT = getAnalysis<DominatorTreeWrapperPass>().getDomTree();
        return InstrumentTestImpl(F, DT, LI, TI).run();
    }

    void getAnalysisUsage(AnalysisUsage &AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
        AU.addRequired<TaskInfoWrapperPass>();
        AU.addRequired<DominatorTreeWrapperPass>();
        AU.addRequiredID(LoopSimplifyID); // must have preheader
    }
private: 
    void toJSON() const {
        json::Object json;
        json["NumTaskNoSync"] = static_cast<uint64_t>(NumTaskNoSync);

        json::Value jsonVal = std::move(json);

        std::string name = "instrument-aux.json";
        std::error_code EC;
        raw_fd_ostream outJSON(name, EC);
        if (EC) {
            errs() << "Error opening file: " << EC.message() << "\n";
            return;
        }
        outJSON << formatv("{0:2}", jsonVal);
    }
};

struct InstrumentTestPass : public PassInfoMixin<InstrumentTestPass>{
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        auto &FAM = AM.getResult<FunctionAnalysisManagerModuleProxy>(M).getManager();
        auto GetDT = [&FAM](Function &F) -> DominatorTree & {
            return FAM.getResult<DominatorTreeAnalysis>(F);
        };
        auto GetLI = [&FAM](Function &F) -> LoopInfo & {
            return FAM.getResult<LoopAnalysis>(F);
        };
        auto GetTI = [&FAM](Function &F) -> TaskInfo & {
            return FAM.getResult<TaskAnalysis>(F);
        };
        auto GetSE = [&FAM](Function &F) -> ScalarEvolution & {
            return FAM.getResult<ScalarEvolutionAnalysis>(F);
        };
        auto GetAC = [&FAM](Function &F) -> AssumptionCache & {
            return FAM.getResult<AssumptionAnalysis>(F);
        };
        SmallVector<Function *, 8> WorkList;
        bool Changed = false;

        for (Function &F : M)
            if (!F.empty())
                WorkList.push_back(&F);
        
        // Transform all loops into simplified, LCSSA form before we process them.
        for (Function *F : WorkList) {
            LoopInfo &LI = GetLI(*F);
            DominatorTree &DT = GetDT(*F);
            ScalarEvolution &SE = GetSE(*F);
            SmallVector<Loop *, 8> LoopWorkList;
            for (Loop *L : LI) {
            Changed |= simplifyLoop(L, &DT, &LI, &SE, &GetAC(*F), nullptr,
                                    /* PreserveLCSSA */ false);
            LoopWorkList.push_back(L);
            }
            for (Loop *L : LoopWorkList)
            Changed |= formLCSSARecursively(*L, DT, &LI, &SE);
        }
            
        for (Function *F : WorkList) {
            LoopInfo &LI = GetLI(*F);
            DominatorTree &DT = GetDT(*F);
            TaskInfo &TI = GetTI(*F);
            Changed |= InstrumentTestImpl(*F, DT, LI, TI).run();
        }
        
        if (Changed)
            return PreservedAnalyses::none();
        return PreservedAnalyses::all();
    }
};


} // end namespace

char InstrumentTestPassLegacy::ID = 0; 
static RegisterPass<InstrumentTestPassLegacy> X(
    INSTR_NAME,
    "insert test instrumentation code such as incrementing or decrementing "
    "region counter, calling lib function incr_dac or incr_ef dynamically based "
    "on delegate_worker's value.",
    false, true
);

// namespace llvm {
// Pass *createInstrumentTestPassLegacy() { return new InstrumentTestPassLegacy(); }
// }

// registered as dynamic pass plugin using new pass manager
PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        PB.registerTapirLateEPCallback([&](ModulePassManager &MPM, auto) {
            MPM.addPass(InstrumentTestPass());
            return true;
        });
    };

    return {LLVM_PLUGIN_API_VERSION, INSTR_NAME, "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}

