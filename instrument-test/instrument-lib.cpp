#ifndef INSTRUMENT_LIB_H
#define INSTRUMENT_LIB_H

#include <iostream>
#include <fstream>
#include <unordered_map>
#include <utility>
#include <cassert>

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

//=== PBBsV2-specific instrumentation ==========================
// parallel_for spec name -> runtime status count
struct PForStats {
    PForStats() {}
    PForStats(std::string dbg_name) : entry_count(0), dbg_name(dbg_name) {}
    void inc() { ++entry_count; }
    uint64_t show_entry_count() { return entry_count; }
    std::string show_dbg_name() { return dbg_name; }
private: 
    uint64_t entry_count;
    std::string dbg_name; // contain callsite dbg metadata
};

std::unordered_map<std::string, PForStats> PForDAC; 
std::unordered_map<std::string, PForStats> PForEF; 

// _source_debug_info: insert at entry of each parallel_for spec
extern "C" {
__attribute__((used))
void _source_debug_info(const char *func_name, const char *sp_name) {
    std::string FuncName(func_name);
    std::string SpName(sp_name);
    if (rc > 0) {
        // dac
        if (PForDAC.find(FuncName) == PForDAC.end()) {
            PForDAC[FuncName] = PForStats(SpName);
        } 
        PForDAC[FuncName].inc();
    } else {
        // ef 
        if (PForEF.find(FuncName) == PForEF.end()) {
            PForEF[FuncName] = PForStats(SpName);
        } 
        PForEF[FuncName].inc();
    }
}
}

//=== Print Function ==============================
extern "C" {
__attribute__((used))
__attribute__((destructor)) // will be called after main function returns
void print() {
    assert(rc == 0 && "rc should be 0 at the end of execution!");
    // output dac results to dac.csv
    std::ofstream dacCSV("dac.csv");
    if (!dacCSV.is_open()) {
        std::cerr << "Failed to open dac.csv" << std::endl;
        return;
    }
    dacCSV << "dac_count,sp_name,pfor_name\n";

    for (auto &it : PForDAC) {
        uint64_t dac_count = it.second.show_entry_count();
        std::string dbg_name = it.second.show_dbg_name();
        dacCSV << dac_count << "," << dbg_name << "," << it.first << "\n"; 
    }

    dacCSV.close();
    std::cout << "flushed to dac.csv!" << std::endl;

    // output ef results to ef.csv
    std::ofstream efCSV("ef.csv");
    if (!efCSV.is_open()) {
        std::cerr << "Failed to open ef.csv" << std::endl;
        return;
    }
    
    efCSV << "ef_count,sp_name,pfor_name\n";
    for (auto &it : PForEF) {
        uint64_t ef_count = it.second.show_entry_count();
        std::string dbg_name = it.second.show_dbg_name();
        efCSV << ef_count << "," << dbg_name << "," << it.first << "\n";
    }

    efCSV.close(); 
    std::cout << "flushed to ef.csv!" << std::endl;
}
}


#endif