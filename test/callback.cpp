#include <cstdlib>

volatile int loc;

__attribute__((noinline))
void myFunction1(int x) {
    loc += x;
}

__attribute__((noinline))
void myFunction2(int x) {
    loc = x + 1;
}

__attribute__((noinline))
// __attribute__((callback (func, value)))
void executeFuncPtr(void *func, int value) {

    ((void(*)(int))(func))(value + 1);
    ((void(*)(int))(func))(value - 1);
}

__attribute__((noinline))
int demo() {
    int *loc = (int*)malloc(sizeof(int));
    executeFuncPtr((void *)(&myFunction1), 5);
    executeFuncPtr((void *)(&myFunction2), 5);
    return 0;
}
