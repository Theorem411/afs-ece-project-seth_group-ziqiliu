#!/usr/bin/bash
set -e

CHEETAH=/afs/ece/project/seth_group/ziqiliu/cheetah/build

clang++ -DPARLAY_OPENCILK -mllvm -experimental-debug-variable-locations=false \
    -fforkd=lazy -ftapir=serial \
    --opencilk-resource-dir=$CHEETAH_DIR \
    --gcc-toolchain=/afs/ece/project/seth_group/ziqiliu/GCC-12.2.0 \
    -mcx16 -O3 -std=c++17 -DNDEBUG -I . -ldl -fuse-ld=lld \
    -Xclang -fpass-plugin=libBuiltinIntrinsic.so \
    -o test.o -c pforinst-test.C \
    -L${INSTRUMENT_DIR} -lPforinst

# opt -load-pass-plugin=instrument-pass.so -p \
#     -load . -instrument-test \
#     -debug-only=instrument-test \
#     -S ../test/simplepfor.ll -o ./simplepfor.ll

# clang -gdwarf-2 -O3 -ftapir=serial \
#     -fuse-ld=lld --opencilk-resource-dir=$CHEETAH \
#     -mllvm -debug-only=instrument-pass \
#     -Xclang -fpass-plugin=instrument-pass.so \
#     simplepfor.cpp -o simplepfor -L. -lInstrument