#ifndef INSTRUMENT_LIB_H
#define INSTRUMENT_LIB_H

#include <iostream>
#include <fstream>
#include <unordered_map>
#include <utility>

// global datastructure 

    
uint64_t rc = 0;
std::unordered_map<std::string, std::unordered_map<std::string, uint64_t>> LoopToDACCount = {};
std::unordered_map<std::string, std::unordered_map<std::string, uint64_t>> LoopToEFCount = {};

__attribute__((constructor(101)))
void init() {
    
}

// loop dac/ef count update logic: insert at loop header
extern "C" {
__attribute__((used))
void _inc_dac(const char *func_name, const char *loop_name) {
    std::string FuncName(func_name);
    std::string LoopName(loop_name);
    // LoopToDACCount[FuncName][LoopName]++;
    // std::cout << "inc_dac: " << LoopName << "\n";
    if (LoopToDACCount.find(FuncName) == LoopToDACCount.end()) {
        LoopToDACCount[FuncName] = std::unordered_map<std::string, uint64_t>();
    }
    auto& L2DAC = LoopToDACCount[FuncName];
    if (L2DAC.find(LoopName) == L2DAC.end()) {
        L2DAC[LoopName] = 1;
    } else {
        L2DAC[LoopName]++;
    }


}

__attribute__((used))
void _inc_ef(const char *func_name, const char *loop_name) {
    std::string FuncName(func_name);
    std::string LoopName(loop_name);
    // LoopToEFCount[FuncName][LoopName]++;
    if (LoopToEFCount.find(FuncName) == LoopToEFCount.end()) {
        LoopToEFCount[FuncName] = std::unordered_map<std::string, uint64_t>();
    }
    auto &L2EF = LoopToEFCount[FuncName];
    // std::cout << "inc_ef: " << LoopName << "\n";
    if (L2EF.find(LoopName) == L2EF.end()) {
        L2EF[LoopName] = 1;
    } else {
        L2EF[LoopName]++;
    }
    // debug
    // std::cout << "printing loop to dynamic EF count (size: " << LoopToEFCount.size() << ")...\n";
    // for (auto &it : LoopToEFCount) {
    //     std::cout << it.first << ": " << it.second << "\n";
    // }
}

__attribute__((used))
void _choice(const char *func_name, const char *loop_name) {
    // std::string FuncName(func_name);
    // std::string LoopName(loop_name);
    // std::cout << "choice: " << LoopName << "\n";
    if (rc > 0) {
        _inc_dac(func_name, loop_name);
    } else {
        _inc_ef(func_name, loop_name);
    }
}
}

// rc update logic: insert at task boundaries 
extern "C" {
__attribute__((used))
void _rc_bump_up() {
    // std::cout << "rc_bump_up!\n";
    ++rc;
}

__attribute__((used))
void _rc_bump_down() {
    // std::cout << "rc_bump_down!\n";
    --rc;
}
}

//=== Source Level Debug ==========================
// func name -> loop name -> file name x line number
std::unordered_map<
    std::string, std::unordered_map<
        std::string, std::pair<std::string, uint64_t>
    >
> LoopSource = {};

// source level debug info tracking logic: insert next to _choice
extern "C" {
__attribute__((used))
void _source_debug_info(const char *func_name, const char *loop_name, 
                        const char *file_name, uint64_t ln) {
    std::string FuncName(func_name);
    std::string LoopName(loop_name);
    std::string FileName(file_name);
    if (LoopSource.find(FuncName) == LoopSource.end()) {
        LoopSource[FuncName] = std::unordered_map<std::string, std::pair<std::string, uint64_t>>();
    }
    auto &L2Src = LoopSource[FuncName];
    L2Src[LoopName] = std::make_pair(FileName, ln);
}
}

//=== Print Function ==============================
extern "C" {
__attribute__((used))
__attribute__((destructor)) // will be called after main function returns
void print() {
    // output dac results to dac.csv
    std::ofstream dacCSV("dac.csv");
    if (!dacCSV.is_open()) {
        std::cerr << "Failed to open dac.csv" << std::endl;
        return;
    }
    dacCSV << "funcname,loopname,file,ln,dac_count\n";

    // std::cout << "printing loop to dynamic DAC count (size: " << LoopToDACCount.size() << ")...\n";
    for (auto &it : LoopToDACCount) {
        std::string funcname = it.first;
        auto &L2DAC = it.second;
        for (auto &it : L2DAC) {
            std::string loopname = it.first;
            uint64_t dac_count = it.second;

            auto &pair = LoopSource[funcname][loopname];
            std::string filename = pair.first;
            uint64_t ln = pair.second;

            dacCSV << funcname 
                << "," << loopname 
                << "," << filename
                << "," << ln
                << "," << dac_count 
                << std::endl;
        }
    }
    dacCSV.close();
    std::cout << "flushed to dac.csv!" << std::endl;

    // output ef results to ef.csv
    std::ofstream efCSV("ef.csv");
    if (!efCSV.is_open()) {
        std::cerr << "Failed to open ef.csv" << std::endl;
        return;
    }
    
    efCSV << "funcname,loopname,file,ln,dac_count\n";

    // std::cout << "printing loop to dynamic EF count (size: " << LoopToEFCount.size() << ")...\n";
    for (auto &it : LoopToEFCount) {
        std::string funcname = it.first;
        auto &L2EF = it.second;
        for (auto &it : L2EF) {
            std::string loopname = it.first;
            uint64_t ef_count = it.second;

            auto &pair = LoopSource[funcname][loopname];
            std::string filename = pair.first;
            uint64_t ln = pair.second;

            efCSV << funcname 
                << "," << loopname 
                << "," << filename
                << "," << ln
                << "," << ef_count 
                << std::endl;
        }
    }
    efCSV.close();

    std::cout << "flushed to ef.csv!" << std::endl;
}
}


#endif