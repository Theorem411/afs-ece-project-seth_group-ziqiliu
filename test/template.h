#ifndef TEMPLATE_H
#define TEMPLATE_H

#include "stdio.h"
#include "stdlib.h"
#include <cilk/cilk.h>

template <typename F> // __attribute__((noinline))
inline void parallel_for(size_t start, size_t end, F f, long granularity) {
    cilk_for(size_t i=start; i<end; i++) f(i);
}

#endif