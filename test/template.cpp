#include "template.h"

int main(int argc, char** argv) {
    long start = atol(argv[1]);
    long end = atol(argv[2]);

    int res = 0;
    auto f = [&](size_t i) {
        res += i;
    };
    parallel_for(start, end, f, 1); // granularity doesn't matter here

    auto g = [&](size_t i) {
        res += 2 * i;
    };
    parallel_for(start, end, g, 2);

    return res;
}