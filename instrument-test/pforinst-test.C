#include <vector>
#include <iostream>
#include "parlay/primitives.h"
#include "parlay/random.h"
#include "common/geometry.h"
#include "common/get_time.h"
#include "common/topology.h"
#include "common/atomics.h"

using parlay::parallel_for;

int main() {
    vector<int> nums(100, 0);

    parallel_for(0, 100, [&](size_t i) {
        ++nums[i];
    });
    
    return 0;
}