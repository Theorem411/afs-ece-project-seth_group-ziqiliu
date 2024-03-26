all: instrument-pass.so libInstrument.so

CXX = /afs/ece/project/seth_group/ziqiliu/GCC-12.2.0/bin/g++-12.2.0

CXXFLAGS = -rdynamic $(shell llvm-config --cxxflags) -g -O0 -fPIC

instrument-lib.o: instrument-lib.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@

libInstrument.so: instrument-lib.o
	$(CXX) -fPIC -dylib -shared $^ -o $@

instrument-pass.o: instrument-pass.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@

instrument-pass.so: instrument-pass.o
	$(CXX) -fPIC -dylib -shared $^ -o $@

# for debug
instrument-lib.ll: instrument-lib.cpp
	clang++ -O0 -Wall \
		-c $^ -S -emit-llvm -o $@
	
clean: 
	rm *.ll *.so *.o

.PHONY: all clean