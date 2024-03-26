all: PrrStatistic.so ParallelForDebugInfo.so

CXX = /afs/ece/project/seth_group/ziqiliu/GCC-12.2.0/bin/g++-12.2.0

CXXFLAGS = -rdynamic $(shell llvm-config --cxxflags) -g -O0 -fPIC

PrrStatistic.so: PrrStatistic.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o PrrStatistic.o
	$(CXX) -fPIC -dylib -shared PrrStatistic.o -o $@

ParallelForDebugInfo.so: ParallelForDebugInfo.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o ParallelForDebugInfo.o
	$(CXX) -fPIC -dylib -shared ParallelForDebugInfo.o -o $@

clean: 
	rm *.o *.ll *.so *.csv *.json

.PHONY: all clean
