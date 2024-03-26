/*
 * Copyright (c) 1994-2003 Massachusetts Institute of Technology
 * Copyright (c) 2003 Bradley C. Kuszmaul
 * Copyright (c) 2013 I-Ting Angelina Lee and Tao B. Schardl 
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */
#include <assert.h>
#include <cilk/cilk.h>
#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>
#include <sys/time.h>

#define callerTrashed() asm volatile("# all caller saved are trashed here" : : : "rdi", "rsi", "r8", "r9", "r10", "r11", "rdx", "rcx", "rax")
#define calleeTrashed() asm volatile("# all callee saved are trashed here" : : : "rbx", "r12", "r13", "r14", "r15", "rax")
#define intregTrashed() asm volatile("# all integer saved are trashed here" : : : "rbx", "r12", "r13", "r14", "r15", "rax", "rdi", "rsi", "r8", "r9", "r10", "r11", "rdx", "rcx", "xmm0")
#define getSP(sp) asm volatile("#getsp\n\tmovq %%rsp,%[Var]" : [Var] "=r" (sp))

unsigned long long todval (struct timeval *tp) {
    return tp->tv_sec * 1000 * 1000 + tp->tv_usec;
}

/* timer support */
static unsigned long long __cilkrts_getticks(void)
{
#if defined __i386__ || defined __x86_64
  unsigned a, d;
  __asm__ volatile("rdtsc" : "=a" (a), "=d" (d));
  return ((unsigned long long)a) | (((unsigned long long)d) << 32);
#else
#   warning "unimplemented cycle counter"
  return 0;
#endif
}

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


int fib(int n);


/*
  
  // Assignment
  parallel_for (size_t i = 0; i < numVertices; i++) {
    Parents[i] = INT_MAX;
  }

  // nested for containting conditional
  parallel_for(intT i = 0; i < fSize; i++) {
      intT k= 0;
      intT v = Frontier[i];
      for (intT j=0; j < G[v].degree; j++) {
        intT ngh = G[v].Neighbors[j];
        if (Parents[ngh] > v) {
          if (utils::writeMin(&Parents[ngh],v)) {
            G[v].Neighbors[k++] = ngh;
          }
        }
      }
      Offsets[i] = k;
   }

   parallel_for (intT i=0; i<n; i++) {
    if (triangs[i].initialized >= 0) {
      simplex t = simplex(&triangs[i],0);
      for (int i=0; i < 3; i++) {
	simplex a = t.across();
	if (a.valid()) {
	  vertex* v = a.rotClockwise().firstVertex();
	  if (!t.outside(v)) {
	    cout << "Inside Out: "; v->pt.print(); t.print();}
	  if (t.inCirc(v)) {
	    cout << "In Circle Violation: "; v->pt.print(); t.print(); }
	} else bcount[i]++;
	t = t.rotClockwise();
       }
      }
    } 
  
   // Assignment with condition
   parallel_for (long i=0; i < n; i++)
      if (isSpace(Str[i])) Str[i] = 0;

   // Assignemnt with binary operation
   parallel_for (long i=1; i < n; i++) FL[i] = Str[i] && !Str[i-1];

   // Assignment from function
   {parallel_for(long i=0; i < n; i++) L[i] = xToStringLen(A[i])+1;}

   // Assignment with function call
   parallel_for(long i=0; i < n-1; i++) {
      //for(long i=0; i < n-1; i++) {
      xToString(B + L[i],A[i]);
      B[L[i+1] - 1] = '\n';
   }

   // Recursive parallel_for
   // In radixLoopTopDown, the segNexOffset = ..., can make the induction variable  
   void radixLoopTopDown(....) {
        ......
        parallel_for (int i = 0; i < BUCKETS; i++) {
	  tracker[i] = i+1;
	  long segOffset = offsets[i];
	  long segNextOffset = (i == BUCKETS-1) ? n : offsets[i+1];
	  long segLen = segNextOffset - segOffset;
	  long blocksOffset = ((long) floor(segOffset * y)) + i + 1;
	  long blocksNextOffset = ((long) floor(segNextOffset * y)) + i + 2;
	  long blockLen = blocksNextOffset - blocksOffset;
	  radixLoopTopDown(A + segOffset, B + segOffset, Tmp + segOffset, 
			 BK + blocksOffset, blockLen, segLen,
			 bits-MAX_RADIX, f);
      
         }
   }
   
   void integer_sort() {
   ...

     if (shift_bits > 0) {
       parallel_for_1(size_t i = 0; i < num_buckets; i++) {
         auto out_slice = Out.slice(bucket_offsets[i],bucket_offsets[i+1]);
         integer_sort<KT>(out_slice, out_slice, g, shift_bits, depth+1);
       }
     }
    ...
    }

   // Series of assignment instruction
   {parallel_for(intT i=0;i<m;i++) {E[i].u = A.E[i].u; E[i].v = A.E[i].v;}}

   // Series of parallel for
   parallel_for (intT i=0; i < m; i++)
    for (int j=0; j<3; j++) {
      E[i*3 + j] = edge(pairInt(T[i].C[j], T[i].C[(j+1)%3]), &Triangs[i]);
      ET.insert(&E[i*3+j]);
      Triangs[i].vtx[(j+2)%3] = &v[T[i].C[j]];
    }

    parallel_for (intT i=0; i < m; i++) {
      Triangs[i].id = i;
      Triangs[i].initialized = 1;
      Triangs[i].bad = 0;
      for (int j=0; j<3; j++) {
        pairInt key = pairInt(T[i].C[(j+1)%3], T[i].C[j]);
        edge *Ed = ET.find(key);
        if (Ed != NULL) Triangs[i].ngh[j] = Ed->second;
        else { Triangs[i].ngh[j] = NULL;
	  //Triangs[i].vtx[j]->boundary = 1;
	  //Triangs[i].vtx[(j+2)%3]->boundary = 1;
        }
       }
    }

    // Series of simple parallel for
    parallel_for (intT i=0; i < m1; i++) Itmp[i+1] = I[i];
    parallel_for (intT i=0; i < m2; i++) Itmp[i+m1+2] = I[i+n1];

    // While inside parallel for (non deterministic)
   parallel_for(intT i=0;i<n;i++){
    intT v = i;
    while(1){
      //drop out if already in or out of MIS
      if(Flags[v]) break;
      //try to lock self and neighbors
      if(utils::CAS(&V[v], false, true)) {
	intT k = 0;
	for(intT j=0; j<G[v].degree; j++){
	  intT ngh = G[v].Neighbors[j];
	  //if ngh is not in MIS or we successfully 
	  //acquire lock, increment k
	  if(Flags[ngh] == 2 || utils::CAS(&V[ngh], false, true)) k++;
	  else break;
	}
	if(k == G[v].degree){ 
	  //win on self and neighbors so fill flags
	  Flags[v] = 1;
	  for(intT j=0;j<G[v].degree;j++){
	    intT ngh = G[v].Neighbors[j]; 
	    if(Flags[ngh] != 2) Flags[ngh] = 2;
	  }
	} else { 
	  //lose so reset V values up to point
	  //where it lost
	  V[v] = false;
	  for(intT j = 0; j < k; j++){
	    intT ngh = G[v].Neighbors[j];
	    if(Flags[ngh] != 2) V[ngh] = false;
	  }
	}
      }
    }
  }

  // 


 */


inline size_t num_workers() { return __cilkrts_get_nworkers(); }

__attribute__((noinline)) void parallel_for_recurse(size_t start, size_t end,
						    long granularity, long m, long* res) {

 tail_recurse:
   if ((end - start) <= (granularity)) {
     for (size_t i=start; i < end; i++) { 
       for(volatile long j=0; j<m; j++) {
	 // Cycles: J*5
	 //if(&res[i] == NULL)
	   //  printf ("i:%d\n", i);
	 //assert(&res[i] != NULL && "res[i] NULL");
	 res[i] = 1;
	 volatile int a = 0;
	 a++;
       }
     }
   } else {
     size_t n = end-start;
     size_t mid = (start + n/2);
     cilk_spawn parallel_for_recurse(start, mid, granularity, m, res);
     start = mid;
     goto tail_recurse;
   }
   
   cilk_sync;
   
}

__attribute__((noinline)) void parallel_for_seq(size_t start, size_t end,
						    long granularity, long m, long* res) {

#if 0
  size_t len = end - start;
  size_t len_g = len/granularity;
  if (len_g > 1) {
    cilk_for (size_t i=0; i < len_g; i++) {
      for (size_t k=0; k<granularity; k++) {
	for(volatile long j=0; j<m; j++) {
	  // Cycles: J*5
	  //printf("i:%ld\n", start+granularity*i+k);
	  res[start+granularity*i+k] = 1;
	  volatile int a = 0;
	  a++;
	}
      }
    }
    long start_rem = start + granularity*(len_g);
    for(size_t i = start_rem; i<end; i++) {
      for(volatile long j=0; j<m; j++) {
	// Cycles: J*5
	//printf("rem i:%ld\n", i);
	res[i] = 1;
	volatile int a = 0;
	a++;
      }
    }
  } else {
    cilk_for (size_t i=start; i < end; i++) {
      for(volatile long j=0; j<m; j++) {
	// Cycles: J*5
	res[i] = 1;
	volatile int a = 0;
	a++;
      }
    }
  }  
#endif 
}


__attribute__((noinline))
__attribute__((no_unwind_path))
void parallel_for_static(size_t start, size_t end, long granularity,
			 long m, long* res, void** resumeCtx) {

  int size = end - start;
  size_t nWorkers = num_workers();
  size_t static_range = size/nWorkers;

  if(size < granularity ) {
    for(int i=start; i<end; i++) {
      for(volatile long j=0; j<m; j++) {
	// Cycles: J*5
	res[i] = 1;
	volatile int a = 0;
	a++;
      }      
    }
  } else {
    if(static_range < 1) {
      static_range = 1;
      nWorkers = size;
    }
    resumeCtx[17] = (void*)nWorkers;

    //printf("det cont: %p\n", &&det_cont);
    volatile void* parallelCtx[64];
    //int volatile dummy_a= 0;
    //__asm__ volatile("movl $0, %[ARG]\n\t":[ARG] "=r" (dummy_a));
    //__builtin_uli_save_context_nosp((void*)parallelCtx, &&det_cont);
    //if(dummy_a) {
    //  goto det_cont;
    //}
    // This a save context_nosp
    __builtin_multiret_call(2, 1, &parallel_for_static, (void*)parallelCtx, &&det_cont, &&det_cont);

    for(int i=1; i<nWorkers; i++) {
      push_workmsg((void**)parallelCtx, i);
    }

    //assert(&&det_cont > 0x1 && "Label does not exist");
    //printf("[%d]Start range static: %d %d\n", threadId, start, start+static_range);
    //printf("[%d] paralellCtx[I_RIP]:%p\n", threadId, parallelCtx[1]);
    parallel_for_recurse(start, start+static_range, granularity, m, res);
    //parallel_for_recurse(0, n, granularity, m, res);
    //for (size_t i=start; i < start+static_range; i++) f(i);
    return;

  det_cont: {
    //callerTrashed();
    int start_par = start + threadId*static_range;
    int end_par = start + (threadId+1)*(static_range);
    if(threadId == nWorkers-1)
      end_par = end;

    //printf("[%d] execute work: %p\n", threadId, get_stacklet_ctx()[1]);

    //printf("[%d]Start range static: %d %d\n", threadId, start_par, end_par);
    parallel_for_recurse(start_par, end_par, granularity, m, res);
    //parallel_for_recurse(0, n, granularity, m, res);
    //for (size_t i=start_par; i < end_par; i++) f(i);
    //printf("[%d] resumeCtx[17] [%p]: %p Newsp: %p\n", threadId, &resumeCtx[17], resumeCtx[17], get_stacklet_ctx()[18]);
    resume2scheduler((void**)resumeCtx, get_stacklet_ctx()[18]);
    }
  }
}


__attribute__((noinline))
void startup_cilk(long n, long m, long granularity, long* res) {  
  unsigned long long sumRes = 0;


#if 1

#if 1
  //parallel_for_seq(0, n, granularity, m, res);
  parallel_for_recurse(0, n, granularity, m, res);
#else

  
  //int volatile dummy_a= 0;
  //asm volatile("movl $0, %[ARG]\n\t":[ARG] "=r" (dummy_a));
  volatile void* resumeCtx[64];
  resumeCtx[17] = (void*)num_workers();
  resumeCtx[19] = 0;
  resumeCtx[23] = (void *)3;
  //printf("\n[%d]Start paralell static: %d %d ctx:%p\n", threadId, start, end, resumeCtx);
  //assert(&&sync_pre_resume_parent > 0x1 && "Label does not exist");
  parallel_for_static(0, n, granularity, m, res, (void**)resumeCtx);

  if(resumeCtx[17] > (void*)1) {
    assert(resumeCtx[17] != 0 && "Synchronizer can not be 0 here");
    //__builtin_uli_save_context((void*)resumeCtx, &&sync_pre_resume_parent);
    getSP(resumeCtx[2]);
    __builtin_multiret_call(2, 1, &startup_cilk, (void*)resumeCtx, &&sync_pre_resume_parent, &&sync_pre_resume_parent);  
    //if(dummy_a) {
    //  goto sync_pre_resume_parent;
    //}
    //printf("[%d] resumeCtx[17] : [%p]:%p RIP: %p\n", threadId, &resumeCtx[17], resumeCtx[17], resumeCtx[1]);
    suspend2scheduler_shared((void**)resumeCtx);
  sync_pre_resume_parent: {
      //intregTrashed();
    }
  }

  //printf("End of pfor\n");


#endif  

#else
  for (size_t i=0; i < n; i++) { 
    for(volatile long j=0; j<m; j++) {
      // Cycles: J*5
      res[i] = 1;
      volatile int a = 0;
      a++;
    }
  }
#endif
  
}

#ifdef SERIAL
#include <cilk/cilk_stub.h>
#endif

int main(int argc, char *argv[]) {

  long n, m, maxGran, round;
  long* result;

  round = 1;
  if (argc != 5) {
    fprintf(stderr, "Usage: pfor [<cilk options>] <n> <m> <maxgran> <number of round>\n");
    exit(1); 
  }

  n = atol(argv[1]);
  m = atol(argv[2]);
  maxGran = atol(argv[3]);
  round = atol(argv[4]);

  result = calloc(n, sizeof(long));
  long resval = 0;
  
  //assert(result != NULL && "result null");

  size_t len = n;
  //size_t eightNworkers = 8*__cilkrts_get_nworkers();
  //long granularity = (len + eightNworkers -1 )/(eightNworkers);
  //if(granularity > maxGran)
  long granularity = maxGran;

  //printf("PBBS-time:");
  for(long r=0; r<round; r++) {

    struct timeval t1, t2;
    gettimeofday(&t1,0);
    startup_cilk(n, m, granularity, result);
    gettimeofday(&t2,0);
    unsigned long long runtime_ms = (todval(&t2)-todval(&t1))/1000;
    printf("%f,", runtime_ms/1000.0);
  }
  printf("\n");

  

  for(long i=0; i<n; i++) {
    assert(result[i] == 1 && "Invalid result");
  }

  free(result);
  return 0;
}
