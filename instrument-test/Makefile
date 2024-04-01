all: instrument-pass.so libInstrument.so libBuiltinIntrinsic.so libPforinst.so

CXX = /afs/ece/project/seth_group/ziqiliu/GCC-12.2.0/bin/g++-12.2.0

CXXFLAGS = -rdynamic $(shell llvm-config --cxxflags) -g -O0 -fPIC

instrument-lib.o: instrument-lib.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@

libInstrument.so: instrument-lib.o
	$(CXX) -fPIC -dylib -shared $^ -o $@
	
pforinst.ll: pforinst.cpp
	clang++ $(CXXFLAGS) -S -emit-llvm -o $@ $^
# if output .ll, use clang++ instead of g++
	
libPforinst.so: pforinst.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o pforinst.o
	$(CXX) -fPIC -dylib -shared pforinst.o -o $@

instrument-pass.so: instrument-pass.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o instrument-pass.o
	$(CXX) -fPIC -dylib -shared instrument-pass.o -o $@

libBuiltinIntrinsic.so: builtinIntrinsicPass.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o builtinIntrinsicPass.o
	$(CXX) -fPIC -dylib -shared builtinIntrinsicPass.o -o $@

# for debug
instrument-lib.ll: instrument-lib.cpp
	clang++ -O0 -Wall \
		-c $^ -S -emit-llvm -o $@
	
clean: 
	rm *.ll *.so *.o

.PHONY: all clean