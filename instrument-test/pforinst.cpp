#include<set>
#include<map>
#include<unordered_map>
#include<vector>
#include<iostream>

std::unordered_map<std::string, std::vector<std::tuple<size_t, long, int>>> pfor_metadata;

extern "C" {
__attribute__((used))
void lazydIntrumentLoop (const char *filename_and_line, size_t tripcount, long grainsize, int depth){
    std::string FilenameAndLine(filename_and_line);
    pfor_metadata[FilenameAndLine].push_back(std::make_tuple(tripcount, grainsize, depth));
}

__attribute__((used))
__attribute__((destructor))
void lazydIntrumentLoopDump () {
    for (auto &elem : pfor_metadata) {
        for (auto &value : elem.second) {
            size_t tripcount; long grainsize; int depth;
            std::tie(tripcount, grainsize, depth)= value;
            std::cout << "FileAndLineNumber," << elem.first << ",tripcount," << tripcount << ",grainsize," << grainsize << ",depth," << depth << "\n";
        }
    }
}
}


// Example use of the builtin
//__builtin_uli_lazyd_inst((void*)lazydIntrumentLoop, nullptr, end-start+1, granularity, delegate_work);

// Needs to be lowered in your transformation to a form :

//lazydIntrumentLoop(filename_and_line_number, end-start+1, granularity, delegate_work);

// Example of lowering can be found in : my-opencilk-repo/llvm/lib/Transforms/ULI/SendUli.cpp

// lazydIntrumentLoopDump () need to be placed at the end of the main function. 
