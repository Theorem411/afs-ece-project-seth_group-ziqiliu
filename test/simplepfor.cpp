#include "stdio.h"
#include "stdlib.h"
#include <cilk/cilk.h>

using namespace std;

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
#pragma cilk grainsize 1
    cilk_for(int i = start; i < end; i++) {
        res[i] = i;
    }
    endT=__cilkrts_getticks();

    long i = start;
    for (long i = start; i < end; i++) {
        printf("res[%ld]=%d\n", i, res[i]);
    }

    fprintf(stderr, "Time: %llu\n", endT-startT);

    return 1;
}
