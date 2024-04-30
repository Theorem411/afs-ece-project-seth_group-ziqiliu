#ifndef INSTRUMENT_LIB_H
#define INSTRUMENT_LIB_H

#include <iostream>
#include <fstream>
#include <unordered_map>
#include <unordered_set>
#include <utility>
#include <cassert>

// global datastructure 
bool instrumentTimeLoopOnly = false;

int64_t rc = 0;
std::unordered_map<std::string, std::unordered_map<std::string, uint64_t>> LoopToDACCount = {};
std::unordered_map<std::string, std::unordered_map<std::string, uint64_t>> LoopToEFCount = {};


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
    if (!instrumentTimeLoopOnly)
        return;
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
    assert(rc > 0 && "_rc_bump_down called when rc == 0!");
    --rc;
}
}

//=== PBBsV2-specific instrumentation ==========================
// parallel_for spec name -> runtime status count
struct CalleeStats {
    CalleeStats() {}
    CalleeStats(std::string dbg_name) : entry_count(0), dbg_name(dbg_name) {}
    void inc() { ++entry_count; }

    void insert_caller(std::string caller_name, std::string prs) {
        if (callers.find(caller_name) == callers.end()) {
            callers[caller_name] = std::make_tuple(0, 0);
        }

        if (prs == "defef") {
            ++std::get<0>(callers[caller_name]);
        } else if (prs == "defdac") {
            ++std::get<1>(callers[caller_name]);
        }
    }

    uint64_t show_entry_count() { return entry_count; }
    std::string show_dbg_name() { return dbg_name; }

    std::unordered_map<std::string, std::tuple<uint64_t, uint64_t>>::const_iterator begin() const {
        return callers.begin();
    }

    std::unordered_map<std::string, std::tuple<uint64_t, uint64_t>>::const_iterator end() const {
        return callers.end();
    }

private: 
    uint64_t entry_count;
    std::string dbg_name; // contain callsite dbg metadata
    std::unordered_map<std::string, std::tuple<uint64_t, uint64_t>> callers; // caller_name to caller prs counts <ef_count, dac_count>
};

std::unordered_map<std::string, CalleeStats> CalleeDacMap; 
std::unordered_map<std::string, CalleeStats> CalleeEfMap; 

std::unordered_map<std::string, CalleeStats> CallerStatsMap;

// _source_debug_info: insert at entry of each parallel_for spec
extern "C" {
__attribute__((used))
void _source_debug_info(const char *func_name, const char *sp_name) {
    if (!instrumentTimeLoopOnly)
        return;
    std::string FuncName(func_name);
    std::string SpName(sp_name);
    if (rc > 0) {
        // dac
        if (CalleeDacMap.find(FuncName) == CalleeDacMap.end()) {
            CalleeDacMap[FuncName] = CalleeStats(SpName);
        } 
        CalleeDacMap[FuncName].inc();
    } else {
        // ef 
        if (CalleeEfMap.find(FuncName) == CalleeEfMap.end()) {
            CalleeEfMap[FuncName] = CalleeStats(SpName);
        } 
        CalleeEfMap[FuncName].inc();
    }
}
}

// _caller_prstate: insert before callsite of each parallel_for template specification
extern "C" {
void _caller_prstate(const char *pfor_name, const char *sp_name, const char *caller_name) {
    if (!instrumentTimeLoopOnly)
        return;
    std::string FuncName(pfor_name);
    std::string SpName(sp_name);
    std::string CallerName(caller_name);
    if (CallerStatsMap.find(FuncName) == CallerStatsMap.end()) {
        CallerStatsMap[FuncName] = CalleeStats(SpName);
    } 
    if (rc > 0) {
        CallerStatsMap[FuncName].insert_caller(CallerName, "defdac");
    } else {
        CallerStatsMap[FuncName].insert_caller(CallerName, "defef");
    }
}
}

//=== Print Function ==============================
extern "C" {
__attribute__((used))
__attribute__((destructor)) // will be called after main function returns
void print() {
    std::cout << "final rc = " << rc << std::endl;
    assert(rc == 0 && "rc should be 0 at the end of execution!");
    // output dac results to dac.csv
    std::ofstream dacCSV("dac.csv");
    if (!dacCSV.is_open()) {
        std::cerr << "Failed to open dac.csv" << std::endl;
        return;
    }
    dacCSV << "dac_count,sp_name,pfor_name\n";

    for (auto &it : CalleeDacMap) {
        uint64_t dac_count = it.second.show_entry_count();
        if (dac_count == 0)
            continue;
        std::string dbg_name = it.second.show_dbg_name();
        dacCSV << dac_count << "," << "\"" << dbg_name << "\"" << "," << it.first << "\n"; 
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
    for (auto &it : CalleeEfMap) {
        uint64_t ef_count = it.second.show_entry_count();
        std::string dbg_name = it.second.show_dbg_name();
        if (ef_count == 0)
            continue;
        efCSV << ef_count << "," << "\"" << dbg_name << "\"" << "," << it.first << "\n";
    }

    efCSV.close(); 
    std::cout << "flushed to ef.csv!" << std::endl;


    // output caller states for double checking
    std::ofstream callerCSV("caller.csv");
    if (!callerCSV.is_open()) {
        std::cerr << "Failed to open caller.csv" << std::endl;
        return;
    }
    callerCSV << "caller_ef_count,caller_dac_count,sp_name,func_name,caller_name\n";
    for (auto &it : CallerStatsMap) {
        std::string pfor_name = it.first;
        CalleeStats pforStats = it.second;
        std::string sp_name = pforStats.show_dbg_name();
        for (auto it = pforStats.begin(); it != pforStats.end(); ++it) {
            std::string caller_name = it->first;
            const std::tuple<uint64_t, uint64_t>& caller_state = it->second;
            callerCSV << std::get<0>(caller_state) << "," 
                << std::get<1>(caller_state) << "," 
                << "\"" << sp_name << "\"" << "," 
                << pfor_name << "," 
                << caller_name << "\n"; 
        }
    }
    callerCSV.close();
    std::cout << "flushed to caller.csv!" << std::endl;
}
}


#endif