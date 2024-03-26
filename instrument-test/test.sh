#!/usr/bin/bash
set -e

make
# opt -load-pass-plugin=instrument-pass.so -p \
#     -load . -instrument-test \
#     -debug-only=instrument-test \
#     -S ../test/simplepfor.ll -o ./simplepfor.ll
CHEETAH=/afs/ece/project/seth_group/ziqiliu/cheetah/build

clang -gdwarf-2 -O3 -ftapir=serial \
    -fuse-ld=lld --opencilk-resource-dir=$CHEETAH \
    -mllvm -debug-only=instrument-pass \
    -Xclang -fpass-plugin=instrument-pass.so \
    simplepfor.cpp -o simplepfor -L. -lInstrument