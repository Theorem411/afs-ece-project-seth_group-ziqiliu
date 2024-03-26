#include "stdio.h"
#include "stdlib.h"
#include <cilk/cilk.h>

int **malloc2DArray(long start, long end) {
    int** res = (int**)malloc(end*sizeof(int *));
    for (long i = 0; i < end; ++i) {
        res[i] = (int *)malloc(end*sizeof(int));
    }
    return res;
}

int main(int argc, char** argv) {
    long start = atol(argv[1]);
    long end = atol(argv[2]);
    int** res = malloc2DArray(start, end);

    cilk_for(int i = start; i < end; i++) {
        cilk_for (int j = start; j < end; j++) {
            res[i][j] = i + j;
        }
    }

    return 1;
}