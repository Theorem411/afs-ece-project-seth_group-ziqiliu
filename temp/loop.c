#include "stdio.h"
#include "stdlib.h"
#include <cilk/cilk.h>

extern int foo(int i);

unsigned long long __cilkrts_getticks(void)
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


int main(int argc, char** argv) {
  long start = atol(argv[1]);
  long end = atol(argv[2]);
  int* res = (int*)malloc(end*sizeof(int));

  unsigned long long startT, endT;

  startT = __cilkrts_getticks();
  //#pragma clang loop unroll_count(20)
  //cilk_for(int i = 0; i<loop; i++) {
#if 0
  for(long i = 0; i<loop; i++) {
    res[i] = i;    
  }
#else
  long i = start;
  void* continueaddr = &&header;
  while(1) {
  header:
    res[i] = i;
    i++;
        
    //#define callerTrashed() asm volatile("# all caller saved are trashed here" : : : "r11")
    //goto continueaddr;      
  
#if 1

    if(i >= end) {
      continueaddr = &&exit;
      exit:
        break;
      
    }

    __asm__ goto("\n\tjmp *%[PC]\n\t"::[PC] "r" (continueaddr)::exit, header);  

#else

    if(i >= end) {
      //continueaddr = &&exit;
      //exit:
      break;
      
    }

    __asm__ goto("\n\tjmp *%[PC]\n\t"::[PC] "r" (continueaddr)::fork_handler, header);  

  fork_handler:
    cilk_spawn ();
    cilk_spawn ();
    cilk_join;
    break;

#endif
    
  }

#endif
  endT=__cilkrts_getticks();
  
  
  for(i = start; i<end; i++) {
    printf("res[%ld]=%d\n", i, res[i]);
  }
  
  fprintf(stderr, "Time: %llu\n", endT-startT);
  return i;

#if 0
 backtrack_routine:
  continueaddr = &&fork_handler
  
#endif

}
