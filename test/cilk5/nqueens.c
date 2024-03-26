#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

#include <cilk/cilk.h>

#if CILKSAN
#include "cilksan.h"
#endif

unsigned long long todval (struct timeval *tp) {
    return tp->tv_sec * 1000 * 1000 + tp->tv_usec;
}

__attribute__((noinline))
void startup_cilk() {
  double g = 2.0;
  cilk_for(int i = 0; i<1000; i++) {
    g /= sin(g);
  }
}

// int * count;

/* 
 * nqueen  4 = 2 
 * nqueen  5 = 10 
 * nqueen  6 = 4 
 * nqueen  7 = 40 
 * nqueen  8 = 92 
 * nqueen  9 = 352 
 * nqueen 10 = 724
 * nqueen 11 = 2680 
 * nqueen 12 = 14200 
 * nqueen 13 = 73712 
 * nqueen 14 = 365596 
 * nqueen 15 = 2279184 
 */

/*
 * <a> contains array of <n> queen positions.  Returns 1
 * if none of the queens conflict, and returns 0 otherwise.
 */
int ok (int n, char *a) {

  int i, j;
  char p, q;

  for (i = 0; i < n; i++) {
    p = a[i];
    for (j = i + 1; j < n; j++) {
      q = a[j];
      if (q == p || q == p - (j - i) || q == p + (j - i))
        return 0;
    }
  }

  return 1;
}

void nqueens (int n, int j, char *a, int *res) {

  char *b;
  int i;
  int *count;
  int solNum = 0;

  if (n == j) {
    //return 1;
    *res = 1;
    return;
  }

  count = (int *) alloca(n * sizeof(int));
  (void) memset(count, 0, n * sizeof (int));

  for (i = 0; i < n; i++) {

    /***
     * ANGE: strictly speaking, this (alloca after spawn) is frowned 
     * up on, but in this case, this is ok, because b returned by 
     * alloca is only used in this iteration; later spawns don't 
     * need to be able to access copies of b from previous iterations 
     ***/
    b = (char *) alloca((j + 1) * sizeof (char));
    memcpy(b, a, j * sizeof (char));
    b[j] = i;

    if(ok (j + 1, b)) {
      // count[i] = 
      cilk_spawn nqueens(n, j + 1, b, &count[i]);
    }
  }
  cilk_sync;

  //#pragma clang loop vectorize(disable)
  for(i = 0; i < n; i++) {
    solNum += count[i];
  }

  *res = solNum;
  return;
  //return solNum;
}


int main(int argc, char *argv[]) { 

  int n = 13;
  int round = 1;
  char *a;
  int res;

  if (argc < 2) {
    fprintf (stderr, "Usage: %s [<cilk-options>] <n>\n", argv[0]);
    fprintf (stderr, "Use default board size, n = 13.\n");
  } else if (argc == 2) {
    n = atoi (argv[1]);
    fprintf (stderr, "Running %s with n = %d.\n", argv[0], n);
  } else {
    n = atoi (argv[1]);
    round = atoi(argv[2]);
    fprintf (stderr, "Running %s with n = %d.\n", argv[0], n);
  }

  // Start up cilk runtime
  startup_cilk();
  
  for(int r=0; r<round; r++) {

    a = (char *) alloca (n * sizeof (char));
    memset(a, 0, sizeof(n * sizeof (char)));
    res = 0;

    struct timeval t1, t2;
    gettimeofday(&t1,0);

    //res = 
    nqueens(n, 0, a, &res);

    gettimeofday(&t2,0);
    unsigned long long runtime_ms = (todval(&t2)-todval(&t1))/1000;
    printf("PBBS-time: %f\n", runtime_ms/1000.0);

    if (res == 0) {
      fprintf (stderr, "No solution found.\n");
    } else {
      fprintf (stderr, "Total number of solutions : %d\n", res);
    }
  }

  return 0;
}
