#include<set>
#include<map>
#include<unordered_map>
#include<vector>
#include <fstream>
#include<iostream>

std::unordered_map<std::string, std::vector<std::tuple<std::string, size_t, long, int>>> pfor_metadata;

extern "C" {

bool instrumentTimeLoopOnly = false;
__attribute__((used))
void lazydIntrumentLoop (const char *linkage_name, const char *filename_and_line, size_t tripcount, long grainsize, int depth){
    if (!instrumentTimeLoopOnly) 
        return;
    std::string FilenameAndLine(filename_and_line);
    std::string LinkageName(linkage_name);
    pfor_metadata[LinkageName].push_back(std::make_tuple(FilenameAndLine, tripcount, grainsize, depth));
}

__attribute__((used))
__attribute__((destructor))
void lazydIntrumentLoopDump () {
    std::ofstream fout("pforinst.csv");
    if (!fout.is_open()) {
        std::cerr << "failed to open pforinst.csv!" << std::endl;
        return;
    }

    fout << "LinkageName,FileAndLineNumber,tripcount,grainsize,depth" << std::endl;
    for (auto &elem : pfor_metadata) {
        for (auto &value : elem.second) {
            std::string filename_n_line; size_t tripcount; long grainsize; int depth;
            std::tie(filename_n_line, tripcount, grainsize, depth) = value;
            fout << elem.first << "," << filename_n_line << "," << tripcount << "," << grainsize << "," << depth << std::endl;
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
