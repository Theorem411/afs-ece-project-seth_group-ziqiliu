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
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/ULI/ParallelRegion.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include <tuple> 
#include <vector>
#include <utility>
#include <unordered_map>
#include <unordered_set>

using namespace llvm;

#define CG_NAME "callgraph-explain"
#define DEBUG_TYPE CG_NAME

cl::opt<std::string> TestName(
    "test", 
    cl::init("default"), 
    cl::Hidden,
    cl::desc("name of benchmark test case")
);

namespace {
struct CallgraphExplainImpl {
    CallgraphExplainImpl(Module &M, const CallGraph &CG, const ParallelRegion &PR) 
        : M(M), CG(CG), PR(PR) {}
    void run();
private: 
    void initCalleeToCallersMap();
    void initFuncInFunArgs();
    void flush();

    std::string printDISubprogram(DISubprogram *DSP) {
        if (!DSP) {
            return "null DISuprgram";
        }
        std::string printout;
        raw_string_ostream ros(printout);

        unsigned ln = DSP->getLine();
        StringRef file = DSP->getFilename();
        StringRef name = DSP->getName();
        // name:file:ln
        ros << "!DISubprogram(" << name << "): " << file << ":" << ln;
        ros.flush();
        return printout;
    }

    std::string printDebugLoc(const DebugLoc &DLoc) {
        if (!DLoc) {
            return "no valid debug loc info";
        }
        // trace back inline history to original line 
        DILocation *DIL = DLoc.get();
        if (!DIL) {
            return "no valid DILocation at line";
        }

        std::string printout; 
        raw_string_ostream ros(printout);

        do {
            unsigned ln = DIL->getLine();
            unsigned col = DIL->getColumn();
            
            DIScope *scope = DIL->getScope();
            std::string file = "";
            if (scope) {
                file = scope->getFilename().str();
            }
            ros << "!DILocation: " << file << ":" << ln << ":" << col;

            if (DISubprogram *DSP = dyn_cast<DISubprogram>(scope)) {
                ros << "\tsubprogram: " << DSP->getName();
            }
            DILocation *InlineAtDIL = DIL->getInlinedAt();
            if (InlineAtDIL) {
                ros << "\n\t\t\tinlined at: ";
            } 
            DIL = InlineAtDIL;
        } while (DIL);

        // if (DILocation *DIL = dyn_cast<DILocation>(scopeLoc)) {
        //     unsigned ln = DIL->getLine();
        //     unsigned col = DIL->getColumn();
            
        //     DIScope *scope = DIL->getScope();
        //     std::string file = "";
        //     if (scope) {
        //         file = scope->getFilename().str();
        //     }
        //     DILocation *inlineAt = DIL->getInlinedAt();
            
        //     // file:ln:col  
        //     ros << "!DILocation: " << file << ":" << ln << ":" << col;
        //     // if (inlineAt) {
        //     //     ros << "\tinline at: ";
        //     //     inlineAt->print(ros);
        //     // }
        // } 
        // else if (DILexicalBlock *DLB = dyn_cast<DILexicalBlock>(scopeLoc)) {
        //     unsigned ln = DLB->getLine();
        //     unsigned col = DLB->getColumn();
        //     std::string file = DLB->getFilename().str();
        //     // file:ln:col
        //     ros << "!DILexicalBlock: " << file << ":" << ln << ":" << col; 
        // } 
        // else if (DISubprogram *DSP = dyn_cast<DISubprogram>(scopeLoc)) {
        //     unsigned ln = DSP->getLine();
        //     StringRef file = DSP->getFilename();
        //     StringRef name = DSP->getName();
        //     // name:file:ln
        //     ros << "!DISubprogram(" << name << "): " << file << ":" << ln;
        // } 
        // else {
        //     ros << "unhanled inline at scope type!: ";
        //     scopeLoc->print(ros);
        // }
        ros.flush();
        return printout;
    }

private:    
    Module &M;
    const CallGraph &CG;
    const ParallelRegion &PR;

    DenseMap<Function *, SmallVector<Instruction *, 8>> CalleeToCallersMap;
    DenseMap<Function *, SmallSet<Instruction *, 4>> FuncInFunArgs;
};

void CallgraphExplainImpl::initFuncInFunArgs() {
    for (auto &it : CG) {
        Function *F = it.second->getFunction();
        if (!F) continue;

        for (auto I = inst_begin(F), E = inst_end(F); I != E; ++I) {
            if (const CallBase *CI = dyn_cast<CallBase>(&*I)) {
                for (unsigned i = 0; i < CI->arg_size(); ++i) {
                    Value *arg = CI->getArgOperand(i);
                    if (PointerType *ptrTy = dyn_cast<PointerType>(arg->getType())) {
                        if (ptrTy->getElementType()->isFunctionTy()) {
                            ConstantExpr *BitCast = dyn_cast<ConstantExpr>(arg);
                            assert(BitCast && BitCast->isCast() && "function pointer argument is not a bitcast!");
                            Function *Callee = dyn_cast<Function>(BitCast->getOperand(0));
                            FuncInFunArgs[Callee].insert(&*I);
                        }
                    }
                }
            }
        }
    }
}

void CallgraphExplainImpl::initCalleeToCallersMap() {
    for (auto &it : CG) {
        CallGraphNode *CGN = it.second.get();
        Function *Caller = it.second->getFunction();
        if (!Caller) continue;

        for (CallGraphNode::CallRecord &CR : *CGN) {
            if (!CR.first.hasValue()) {
                continue;
            }
            Instruction *Callsite = dyn_cast<Instruction>(*CR.first);
            assert(Callsite && "Callrecord cannot find callsite!");
            
            Function *Callee = CR.second->getFunction();
            if (!Callee) continue;
            
            CalleeToCallersMap[Callee].push_back(Callsite);
        }
    }
}

// void CallgraphExplainImpl::flush() {
//     // output to a file
//     std::string FileName = TestName + ".cg.csv";
//     outs() << "\n-----\nFileName: "<< FileName << "\n";
//     std::error_code EC;
//     raw_fd_ostream File(FileName, EC);
//     if (EC) {
//         errs() << "Error opening file: " << EC.message() << "\n";
//         return;
//     }
//     File << "callee_name,callee_state,caller_name,caller_state\n";
//     for (auto &it : CalleeToCallersMap) {
//         Function *Callee = it.first;
//         SmallSet<Function *, 8>& Callers = it.second;
//         for (Function *Caller : Callers) {
//             File << Callee->getName() << "," 
//                 << printPRState(PR[Callee]) << "," 
//                 << Caller->getName() << "," 
//                 << printPRState(PR[Caller]) << '\n'; 
//         }
//     }
// }

void CallgraphExplainImpl::run() {
    // init CalleeToCallersMap
    initCalleeToCallersMap();
    // init 
    initFuncInFunArgs();

    // for each Both state callnode, traverse parentage until both evidence of dac and ef found
    // TODO: 

    for (auto &it : CG) {
        const CallGraphNode *CGN = it.second.get();
        Function *F = CGN->getFunction();
        if (!F) 
            continue;
        if (PR[F] != PRState::Both)
            continue;
        // 
        SmallVector<Instruction *, 4> ParentEF;
        SmallVector<Instruction *, 4> ParentDAC;
        SmallVector<Instruction *, 8> ParentBoth;
        
        for (Instruction *Callsite: CalleeToCallersMap[F]) {
            BasicBlock *CallsiteBlock = Callsite->getParent();
            if (PR[CallsiteBlock] == PRState::DefinitelyEF) {
                ParentEF.push_back(Callsite);
            } else if (PR[CallsiteBlock] == PRState::DefinitelyDAC) {
                ParentDAC.push_back(Callsite);
            } else if (PR[CallsiteBlock] == PRState::Both) {
                ParentBoth.push_back(Callsite);
            }
        }
        
        // if (ParentBoth.size() > 0)
        //     continue;

        if (DISubprogram *DSP = F->getSubprogram()) {
            outs() << DSP->getName() << " : ";
        }
        outs() << F->getName();
        
        outs() << "\n\t" << printPRState(PR[F]) << "\n\tparent(s):\n";

        if (FuncInFunArgs.find(F) != FuncInFunArgs.end()) {
            outs() << "\t\tboth because its address is taken by:\n";
            for (Instruction *CastI : FuncInFunArgs[F]) {
                std::string printout; 
                raw_string_ostream ros(printout);
                CastI->print(ros);
                ros.flush();
                outs() << "\t\t" << StringRef(printout) << '\n';
            }
            continue;
        }

        for (Instruction *CallSiteBoth: ParentBoth) {
            // print out source debug info 
            Function *Caller = CallSiteBoth->getFunction();
            const DebugLoc &DLoc = CallSiteBoth->getDebugLoc();
            DISubprogram *SP = Caller->getSubprogram();

            std::string printout;
            raw_string_ostream ros(printout);
            ros << "\t\tboth" << "\t";
            if (SP) {
                ros << SP->getName() << " : " << Caller->getName();
            } 
            ros << "\n\t\t";
            CallSiteBoth->print(ros);
            ros << "\n\t\tcallsite loc: " << printDebugLoc(DLoc);
            ros << "\n\t\tcaller sp: " << printDISubprogram(SP) << '\n';
            ros.flush();

            outs() << StringRef(printout) << '\n';
        }

        for (Instruction *CallSiteDAC: ParentDAC) {
            // print out source debug info 
            Function *Caller = CallSiteDAC->getFunction();
            const DebugLoc &DLoc = CallSiteDAC->getDebugLoc();
            DISubprogram *SP = Caller->getSubprogram();

            std::string printout;
            raw_string_ostream ros(printout);
            ros << "\t\tdac" << "\t";
            if (SP) {
                ros << SP->getName() << " : " << Caller->getName();
            }
            ros << "\n\t\t";
            CallSiteDAC->print(ros);
            ros << "\n\t\tcallsite loc: " << printDebugLoc(DLoc);
            ros << "\n\t\tcaller sp: " << printDISubprogram(SP) << '\n';
            ros.flush();
            
            outs() << StringRef(printout) << '\n';
        }

        for (Instruction *CallSiteEF: ParentEF) {
            // print out source debug info 
            Function *Caller = CallSiteEF->getFunction();
            const DebugLoc &DLoc = CallSiteEF->getDebugLoc();
            DISubprogram *SP = Caller->getSubprogram();

            std::string printout;
            raw_string_ostream ros(printout);
            ros << "\t\tef" << "\t";
            if (SP) {
                ros << SP->getName() << " : " << Caller->getName();
            }
            ros << "\n\t\t";
            CallSiteEF->print(ros);
            ros << "\n\t\tcallsite loc: " << printDebugLoc(DLoc);
            ros << "\n\t\tcaller sp: " << printDISubprogram(SP) << '\n';
            ros.flush();

            outs() << StringRef(printout) << '\n';
        }
        outs() << '\n';
    }   

    // flush to file
    // flush();
}

//========== New Pass Manager Module Pass ==============
struct CallgraphExplain : public PassInfoMixin<CallgraphExplain> {
    explicit CallgraphExplain() {}

    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        const auto &CG = AM.getResult<CallGraphAnalysis>(M);
        const auto &PR = AM.getResult<ParallelRegionAnalysis>(M);
        CallgraphExplainImpl(M, CG, PR).run();
        return PreservedAnalyses::all();
    }
};
} // end namespace

//========== New Pass Manager Library Plugin ===========
PassPluginLibraryInfo getCallgraphExplainPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        PB.registerPipelineParsingCallback(
            [](StringRef Name, ModulePassManager &PM, auto ) {
                if (Name == CG_NAME) {
                    PM.addPass(CallgraphExplain());
                    return true;
                }
                return false;
            }
        );

        PB.registerTapirLateEPCallback([&](ModulePassManager &MPM, auto) {
            MPM.addPass(CallgraphExplain());
            return true;
        });
    };

    return { LLVM_PLUGIN_API_VERSION, CG_NAME, "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getCallgraphExplainPluginInfo();
}