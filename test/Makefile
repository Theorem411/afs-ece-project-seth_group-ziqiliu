ALL_CXX := $(shell find . -maxdepth 1 -type f | grep -E '(\.cpp|\.c)$$')
ALL_TESTS := $(basename $(ALL_CXX))
ALL_LL := $(patsubst ALL_TESTS)

ALL_PNG = $(ALL_LL:.ll=.png)

CC = clang
CXX = clang++

# Common flags
CHEETAH = /afs/ece/project/seth_group/ziqiliu/cheetah/build
COMMON_FLAGS = -g -ftapir=serial -flto -fuse-ld=lld --opencilk-resource-dir=$(CHEETAH)
CFLAGS = $(COMMON_FLAGS) -Wall -O3
CXXFLAGS = $(COMMON_FLAGS) -Wall -O3
LDFLAGS =

ifeq ($(SERIAL),1)
    SERIAL_FLAGS=-Dcilk_for=for -Dcilk_spawn= -Dcilk_sync=
    CFLAGS += $(SERIAL_FLAGS)
    CXXFLAGS += $(SERIAL_FLAGS)
endif

CFLAGS += $(EXTRA_CFLAGS)
CXXFLAGS += $(EXTRA_CXXFLAGS)
LDFLAGS += $(EXTRA_LDFLAGS)
LDLIBS += $(EXTRA_LDLIBS)

.PHONY : all clean test

default: all

all: $(ALL_TESTS) $(ALL_PNG)

%.ll : %.c
	$(CC) $(CFLAGS) -S -emit-llvm $< -o $@

%.ll : %.cpp
	$(CXX) $(CXXFLAGS) -S -emit-llvm $< -o $@

%.ll : %.cc
	$(CXX) $(CXXFLAGS) -S -emit-llvm $< -o $@

%.ll.callgraph.dot : %.ll
	opt -enable-new-pm=0 -dot-callgraph -callgraph-heat-colors $<
%.png : %.ll.callgraph.dot
	dot -Tpng $< -o $@

# (Other existing rules for building executable targets)
clean :
	rm -f $(ALL_TESTS) *.o *.d* *~ .*.dot *.dot *.png *.ll