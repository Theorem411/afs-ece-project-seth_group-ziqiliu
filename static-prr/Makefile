all: libPrrStatistic.so libParallelForDebugInfo.so libCallgraphExplain.so libLazyDStrategy.so libInlinerPassPrinter.so

CXX = /afs/ece/project/seth_group/ziqiliu/GCC-12.2.0/bin/g++-12.2.0

CXXFLAGS = -rdynamic $(shell llvm-config --cxxflags) -g -O0 -fPIC

libPrrStatistic.so: PrrStatistic.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o libPrrStatistic.o
	$(CXX) -fPIC -dylib -shared libPrrStatistic.o -o $@

libParallelForDebugInfo.so: ParallelForDebugInfo.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o libParallelForDebugInfo.o
	$(CXX) -fPIC -dylib -shared libParallelForDebugInfo.o -o $@

libInlinerPassPrinter.so: InlinerPassPrinter.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o libInlinerPassPrinter.o
	$(CXX) -fPIC -dylib -shared libInlinerPassPrinter.o -o $@

libCallgraphExplain.so: CallgraphExplain.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o libCallgraphExplain.o
	$(CXX) -fPIC -dylib -shared libCallgraphExplain.o -o $@

libLazyDStrategy.so: LazyDStrategy.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o libLazyDStrategy.o
	$(CXX) -fPIC -dylib -shared libLazyDStrategy.o -o $@

clean: 
	rm *.o *.ll *.so *.csv *.json

.PHONY: all clean
