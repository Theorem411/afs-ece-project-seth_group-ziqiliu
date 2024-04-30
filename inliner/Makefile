all: libInlinerPrrPrinter.so

CXX = /afs/ece/project/seth_group/ziqiliu/GCC-12.2.0/bin/g++-12.2.0

CXXFLAGS = -rdynamic $(shell llvm-config --cxxflags) -g -O0 -fPIC

libInlinerPrrPrinter.so: InlinerPrrPrinter.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o libInlinerPrrPrinter.o
	$(CXX) -fPIC -dylib -shared libInlinerPrrPrinter.o -o $@

clean: 
	rm *.o *.so

.PHONY: all clean