#ifndef PARLAY_INTERNAL_SCHEDULER_PLUGINS_OPENCILK_H_
#define PARLAY_INTERNAL_SCHEDULER_PLUGINS_OPENCILK_H_

#include <cstddef>

#include <assert.h>
#include <cilk/cilk.h>
#include <cilk/cilk_api.h>

#include <x86intrin.h>

#include<set>
#include<map>

extern bool enableInstrument;
extern long unsigned histGran[8];
extern long unsigned histMedTaskLen[8];
extern long unsigned histIteration[8];

extern "C"{
extern void resume2scheduler_eager(void** ctx, int fromSync);
extern char sync_eagerd(void** ctx, int owner, void* savedRSP, void* currentRSP);
extern void** allocate_parallelctx2(void**ctx);
extern void set_joincntr(void**ctx);
extern void deallocate_parallelctx(void** ctx);

extern void push_workctx_eager(void** ctx, int* bWorkNotPush);
extern void pop_workctx_eager(void** ctx, int* bWorkNotPush);
extern __thread int threadId;

extern void suspend2scheduler_shared(void** resumeCtx);
extern void resume2scheduler(void** resumeCtx, void* newsp);
extern void push_workmsg(void** parallelCtx, int owner);

extern void **get_stacklet_ctx();
extern unsigned cilkg_nproc;
extern int targetTable[144][2];

extern __thread int initDone;
extern __thread int delegate_work;
extern __thread char bParRealized;
}

#define getSP(sp) asm volatile("#getsp\n\tmovq %%rsp,%[Var]" : [Var] "=r" (sp))

#define callerTrashed() asm volatile("# all caller saved are trashed here" : : : "rdi", "rsi", "r8", "r9", "r10", "r11", "rdx", "rcx", "rax")
#define calleeTrashed() asm volatile("# all callee saved are trashed here" : : : "rbx", "r12", "r13", "r14", "r15", "rax")
#define intregTrashed() asm volatile("# all integer saved are trashed here" : : : "rbx", "r12", "r13", "r14", "r15", "rax", "rdi", "rsi", "r8", "r9", "r10", "r11", "rdx", "rcx", "xmm0")

extern std::map<long unsigned , std::set<long unsigned>> taskLen2Gran;
extern std::map<long unsigned , std::set<long unsigned>> taskLen2Iteration;

#define OPENCILKDEFAULT
//#define OPENCILKDEFAULT_DELEGATE
//#define PARLAYREC_NOOPT
//#define OPENCILKDEFAULT_FINE
//#define PARLAYREC
//#define DELEGATEEAGERPRC
//#define PRCPRL
//#define DELEGATEEAGERPRL
//#define EAGERPRC
#define DELEGATEPRC
//#define DELEGATEPRL
//#define DELEGATEPRL_NOOPT
//#define PUREPRL

//#define NOOPT
#define DELEGATEWORK_ENABLED

#define ss_fence() __asm__ volatile ("lock addl $0,(%rsp)")
namespace parlay {

 // IWYU pragma: private, include "../../parallel.h"

 //inline size_t num_workers() { return __cilkrts_get_nworkers(); }
 // The if statement is needed for classify since num_workers is accessed before intitialized?
 inline size_t num_workers() { return (cilkg_nproc == 0)? __cilkrts_get_nworkers() : cilkg_nproc; }
 inline size_t worker_id() { return __cilkrts_get_worker_number(); }
 //inline size_t worker_id() { return threadId; }

 template <typename F>
 __attribute__((noinline)) void wrapperF(F f) {
   f();
 }

 template <typename F>
 __attribute__((noinline)) void wrapperFi(F f, size_t i) {
   f(i);
 }

template <typename F>
__attribute__((noinline))
void runiteration(size_t start, long granularity, size_t i, F f) {
   for (size_t j=0; j<granularity; j++) {
     f(start+granularity*i+j);
   }
 }

template <typename F>
__attribute__((noinline))
void serial_for(size_t start, size_t end, F f) {
   for (size_t i=start; i < end; i++) f(i);
 }

template <typename F>
__attribute__((noinline))
void parallel_for_noinline(size_t start, size_t end, F f) {
   cilk_for (size_t i=start; i < end; i++) f(i);
 }


 template <typename Lf, typename Rf>
 inline void par_do(Lf left, Rf right, bool) {
   // Cause error in neighbors if not turned on
#ifdef DELEGATEWORK_ENABLED
   delegate_work++;

   // Needed for index, and neighbors when using delegatation. TODO: Why?
   //cilk_spawn wrapperF(right);
   //wrapperF(left);

   cilk_spawn right();
   left();

   cilk_sync;
   delegate_work--;
#else
   //deleted
#endif
 }


template <typename F>
__attribute__((noinline))
__attribute__((no_unwind_path))
__attribute__((forkable))
void parallel_for_eager(size_t start, size_t end, F f, long granularity, bool conservative, int depth, int threshDepth, int threshDepth2);

template <typename F>
__attribute__((noinline))
__attribute__((no_unwind_path))
__attribute__((forkable))
void parallel_for_eager_wrapper(size_t start, size_t end, F f, long granularity, bool conservative, int depth, int threshDepth, int threshDepth2, void** readyCtx) {
  int bWorkNotPush = 0;
  push_workctx_eager(readyCtx, &bWorkNotPush);
  parallel_for_eager(start, end, f, granularity, true, depth, threshDepth, threshDepth2);
  pop_workctx_eager(readyCtx, &bWorkNotPush);
  return;
}

template <typename F>
__attribute__((noinline))
void parallel_for_recurse(size_t start, size_t end, F f, long granularity, bool conservative) {
 tail_recurse:
   if ((end - start) <= static_cast<size_t>(granularity)) {
     for (size_t i=start; i < end; i++) f(i);
   } else {
     size_t n = end-start;
     size_t mid = (start + n/2);
     cilk_spawn parallel_for_recurse(start, mid, f, granularity, true);
     start = mid;
     goto tail_recurse;
   }
   cilk_sync;
 }

static int dummyfcn() {return 0;}

template <typename F>
__attribute__((noinline))
void parallel_for_recurse_seq(size_t start, size_t end, F f, long granularity, bool conservative, long threshold);

template <typename F>
__attribute__((noinline))
void parallel_for_seq(size_t start, size_t end, F f, long granularity, bool conservative) ;

 template <typename F>
__attribute__((noinline))
__attribute__((no_unwind_path))
__attribute__((forkable))
   void parallel_for_eager(size_t start, size_t end, F f, long granularity,  bool conservative, int depth, int threshDepth, int threshDepth2) {

   if(end-start <= threshDepth) {
#if defined(DELEGATEEAGERPRC)
     // deleted
#elif defined(EAGERPRC)
     // deleted
#elif defined(DELEGATEEAGERPRL)
     // deleted
#endif
     return;
   }

   int owner = threadId;
   void* readyCtx[64];
   void** ctx = allocate_parallelctx2((void**)readyCtx);
   getSP(readyCtx[2]);
   readyCtx[23] = NULL;
   readyCtx[21] = NULL;
   readyCtx[24] = (void*) -1;
   readyCtx[19] = (void*)owner;
   readyCtx[20] = (void*)&readyCtx[0];

   if ((end - start) <= static_cast<size_t>(granularity)) {
     for (size_t i=start; i < end; i++) f(i);
   }  else {
     size_t n = end-start;
     size_t mid = (start + n/2);
     __builtin_multiret_call(2, 1, (void*)&dummyfcn, (void*)readyCtx, &&det_cont, &&det_cont);
     parallel_for_eager_wrapper(start, mid, f, granularity, true, depth+1, threshDepth, threshDepth2, (void**) &readyCtx[0]);
   det_cont:{
       parallel_for_eager(mid, end, f, granularity, true, depth+1, threshDepth, threshDepth2);
     }

     // Synchronize
     void* sp2;// = (void*)__builtin_read_sp();
     getSP(sp2);
     if(!sync_eagerd((void**)readyCtx, (int)owner, (void*)readyCtx[2], sp2)) {
       __builtin_multiret_call(2, 1, (void*)&dummyfcn, (void*)readyCtx, &&sync_pre_resume_parent, &&sync_pre_resume_parent);
       resume2scheduler_eager((void**)readyCtx, 1);
     sync_pre_resume_parent: {
	 set_joincntr((void**)readyCtx);
       }
     }
     deallocate_parallelctx((void**)readyCtx);
   }
   return;
 }

template <typename F>
__attribute__((noinline))
void parallel_for_seq(size_t start, size_t end, F f,
		       long granularity,
		       bool conservative) {

#if 1
  size_t len = end - start;
  size_t len_g = len/granularity;
  if (len_g >= 1) {
    cilk_for (size_t i=0; i < len_g; i++) {
#if 1
      for (size_t j=0; j<granularity; j++) {
	f(start+granularity*i+j);
      }
#else
    // deleted
#endif
    }
    long start_rem = start + granularity*(len_g);
    for(size_t i = start_rem; i<end; i++) {
      f(i);
    }
  } else {
    for (size_t i=start; i < end; i++) {
      f(i);
    }
  }
#else
  // deleted
#endif

}

template <typename F>
__attribute__((noinline))
void parallel_for_recurse_seq(size_t start, size_t end, F f, long granularity, bool conservative, long threshold) {

 tail_recurse:
  if ((end - start) <= static_cast<size_t>(granularity)) {
    for (size_t i=start; i < end; i++) f(i);
  } else if ((end - start) <= static_cast<size_t>(threshold)) {
    parallel_for_seq(start, end, f, granularity, true);
  } else {
    size_t n = end-start;
    size_t mid = (start + n/2);
    cilk_spawn parallel_for_recurse_seq(start, mid, f, granularity, true, threshold);
    start = mid;
    goto tail_recurse;
  }
  cilk_sync;
}

template <typename F>
__attribute__((noinline))
void parallel_for_recurse_seq2(size_t start, size_t end, F f, long granularity, bool conservative, long threshold) {

 tail_recurse:
  if ((end - start) <= static_cast<size_t>(threshold)) {
    parallel_for_seq(start, end, f, granularity, true);
  } else {
    size_t n = end-start;
    size_t mid = (start + n/2);
    cilk_spawn parallel_for_recurse_seq2(start, mid, f, granularity, true, threshold);
    start = mid;
    goto tail_recurse;
  }
  cilk_sync;
}


template <typename F>
__attribute__((noinline))
void parallel_for_static_wrapper(size_t start, size_t end, F f, long granularity, size_t static_range, size_t nWorkers, void* parallelCtx) {
  size_t start_par_l = start + threadId*static_range;
  size_t end_par_l = start + (threadId+1)*(static_range);
  if(threadId == nWorkers-1) {
    end_par_l = end;
  }

  if(targetTable[threadId][0] != 0) {
    //printf("[%d] Push work to %d\n", threadId, targetTable[threadId][0]);
    push_workmsg((void**)parallelCtx, targetTable[threadId][0]);
  }
  if(targetTable[threadId][1] != 0) {
    //printf("[%d] Push work to %d\n", threadId, targetTable[threadId][1]);
    push_workmsg((void**)parallelCtx, targetTable[threadId][1]);
  }

#if defined(DELEGATEPRC)
  parallel_for_recurse(start_par_l, end_par_l, f, granularity, true);
#else
  // deleted
#endif
}

template <typename F>
__attribute__((noinline))
__attribute__((no_unwind_path))
__attribute__((forkable))
void parallel_for_static(size_t start, size_t end, F f, long granularity, bool conservative) {
  size_t size = end - start;
  size_t nWorkers = num_workers();
  size_t static_range = size/nWorkers;

  void* resumeCtx[64];
  resumeCtx[17] = (void*)num_workers();
  resumeCtx[19] = (void*)threadId;
  resumeCtx[23] = (void*)3;

  void* parallelCtx[64];
  getSP(resumeCtx[2]);
  __builtin_multiret_call(2, 1, (void*)&dummyfcn, (void*)parallelCtx, &&det_cont_static, &&det_cont_static);

  if(targetTable[threadId][0] != 0) {
    //printf("[%d] Push work to %d\n", threadId, targetTable[threadId][0]);
    push_workmsg((void**)parallelCtx, targetTable[threadId][0]);
  }
  if(targetTable[threadId][1] != 0) {
    //printf("[%d] Push work to %d\n", threadId, targetTable[threadId][1]);
    push_workmsg((void**)parallelCtx, targetTable[threadId][1]);
  }

#if defined(DELEGATEPRC)
  parallel_for_recurse(start, start+static_range, f, granularity, true);
#else
  // deleted
#endif

  if(resumeCtx[17] > (void*)1) { // resumeCtx[17] is num_workers
    //assert(resumeCtx[17] != 0 && "Synchronizer can not be 0 here");
    //getSP(resumeCtx[2]);
    __builtin_multiret_call(2, 1, (void*)&dummyfcn, (void*)resumeCtx, &&sync_pre_resume_parent_static, &&sync_pre_resume_parent_static);
    suspend2scheduler_shared((void**)resumeCtx); // Question: runtime early steal-back
  sync_pre_resume_parent_static: {
    }
  }
  return;

  det_cont_static: {
    parallel_for_static_wrapper(start, end, f, granularity, static_range, nWorkers, parallelCtx);
    resume2scheduler((void**)resumeCtx, get_stacklet_ctx()[18]);
  }
  return;
 }

// __attribute__(()) identifier
template <typename F>
inline void parallel_for(size_t start, size_t end, F f,
                         long granularity,
                         bool ) {
#if defined(OPENCILKDEFAULT)
// deleted
#elif defined(DELEGATEPRC)

  if ((end - start) <= static_cast<size_t>(granularity)) {
    for (size_t i=start; i < end; i++) f(i);
  } else {
    size_t len = end-start;
    if(granularity == 0) {
      long oriGran = granularity;
      size_t eightNworkers = 8*num_workers();
      const long longGrainSize = 2048;
      //const long longGrainSize = 8;
      const long smallGrainSize = (len + eightNworkers -1 )/(eightNworkers);
      granularity = smallGrainSize > longGrainSize ? longGrainSize : smallGrainSize;
    }

    if(len == 0)
      return;

    if(end-start > num_workers() && end-start > granularity && delegate_work == 0 && initDone == 1 && threadId == 0) {
      delegate_work++;
      parallel_for_static(start, end, f, granularity, true);
      delegate_work--;
    } else {
      delegate_work++;
      parallel_for_recurse(start, end, f, granularity, true);
      delegate_work--;
    }
  }
#endif
}


} // namespace parlay

#endif  // PARLAY_INTERNAL_SCHEDULER_PLUGINS_OPENCILK_H_