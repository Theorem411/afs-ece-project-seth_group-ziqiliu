#include <vector>
#include <iostream>
#include "parlay/primitives.h"
#include "parlay/internal/scheduler_plugins/opencilk.h"
// #include "common/parseCommandLine.h"

using namespace std;

// using parlay::parallel_for;

int main() {
    vector<int> nums(100, 0);

    parlay::parallel_for(0, 100, [&](size_t i) {
        ++nums[i];
    });
    
    return 0;
}