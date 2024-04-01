#!/bin/bash

clang++ -ftapir=serial -flto -fuse-ld=lld -O3  \
    --opencilk-resource-dir=../cheetah/build/ -Wall \
    callback.cpp -S -emit-llvm -o callback.ll

# opt --enable-new-pm=0 -S --prr -test=callback \
#     -debug -debug-only=prr,abstract-call-sites \
#     callback.ll -o callback-pr.ll

