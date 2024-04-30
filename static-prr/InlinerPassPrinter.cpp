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
#include "llvm/Analysis/LazyCallGraph.h"
#include "llvm/Transforms/Utils/TapirUtils.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils.h" // for LoopSimplifyID
#include "llvm/Transforms/Utils/ValueMapper.h"

#define PASS_PRINTER_NAME "pass-printer"
#define DEBUG_TYPE PASS_PRINTER_NAME

using namespace llvm;

namespace {

const unsigned INLINE_PASS_THRESHOLD = 10;

struct InlinePassPrinter {
    InlinePassPrinter() : Counter(0U) {}
    
    void registerCallbacks(PassInstrumentationCallbacks &PIC) {
        using namespace::placeholders;
        PIC.registerBeforeNonSkippedPassCallback(
            std::bind(&InlinePassPrinter::beforePass, this, _1, _2));
        PIC.registerAfterPassCallback(
            std::bind(&InlinePassPrinter::afterPass, this, _1, _2));
    }
private: 
    void modulePrinter(StringRef PassID, Any IR, StringRef mode) {
        const Module *M = nullptr;
        const Function *F = nullptr;
        if (any_isa<const Function *>(IR)) {
            F = any_cast<const Function *>(IR);
            M = F->getParent();
        } else if (any_isa<const Module *>(IR)) {
            M = any_cast<const Module *>(IR);
        } else if (any_isa<const LazyCallGraph::SCC *>(IR)) {
            const LazyCallGraph::SCC* SCC = any_cast<const LazyCallGraph::SCC *>(IR);
            if (SCC->size()) {
                LazyCallGraph::Node CGN = *SCC->begin();
                M = CGN.getFunction().getParent();
            }
        }
        if (!M) 
            return;

        std::string s;
        raw_string_ostream os(s);

        os << "********************* " << mode << " " << PassID;
        if (F) {
            os << " @" << F->getName(); 
        }
        os << ":\n";
        os.flush();

        M->print(os, nullptr);
        os.flush();
        outs() << StringRef(s) << '\n';
        outs().flush();
    }

    void beforePass(StringRef PassID, Any IR) {
        if (Counter >= INLINE_PASS_THRESHOLD) {
            return;
        }
        // if (PassID.contains_insensitive("inline")) {
        if (PassID == "InlinerPass") {
            modulePrinter(PassID, IR, "before");
        }
    }

    void afterPass(StringRef PassID, Any IR) {
        if (Counter >= INLINE_PASS_THRESHOLD) {
            return;
        }
        // if (PassID.contains_insensitive("inline")) {
        if (PassID == "InlinerPass") {
            modulePrinter(PassID, IR, "after");
            Counter++;
        }
        return;
    }

private:
    unsigned Counter;
};

} // end namespace

static InlinePassPrinter INLINE_PASS_PRINTER;

PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder &PB) {

        // for each inline pass, print out function state transition
        auto &PIC = *PB.getPassInstrumentationCallbacks();
        INLINE_PASS_PRINTER.registerCallbacks(PIC);

    };

    return {LLVM_PLUGIN_API_VERSION, PASS_PRINTER_NAME, "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}