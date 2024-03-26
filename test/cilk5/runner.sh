INSTRUMENT_DIR=../../instrument-test/instrument-pass.so

# don't use -flto, use flag --Xclang -fpass-plugin=$INSTRUMENT_DIR
clang -gdwarf-2 -ftapir=serial -fuse-ld=lld ../../uli-runtime/ext_lib/libpfm_build/lib/libpfm.a \
    -mllvm -lazy-poll-lowering=unwind-ulifsim \
    -mllvm -lazy-enable-proper-polling=0 \
    -mllvm -lazy-set-maxgrainsize=2048 -fpfor-spawn-strategy=1 \
    -mllvm -lazy-set-maxinstpoll=1 \
    --opencilk-resource-dir=../../cheetah/build/ -Wall -O3 \
    -Xclang -fpass-plugin=$INSTRUMENT_DIR \
    -o fft.o -c fft.c

# don't use -flto, use flag --Xclang -fpass-plugin=$INSTRUMENT_DIR
clang -gdwarf-2 -ftapir=serial -fuse-ld=lld ../../uli-runtime/ext_lib/libpfm_build/lib/libpfm.a \
    -mllvm -lazy-poll-lowering=unwind-ulifsim \
    -mllvm -lazy-enable-proper-polling=0 \
    -mllvm -lazy-set-maxgrainsize=2048 -fpfor-spawn-strategy=1 \
    -mllvm -lazy-set-maxinstpoll=1 \
    --opencilk-resource-dir=../../cheetah/build/ -Wall -O3 \
    -Xclang -fpass-plugin=$INSTRUMENT_DIR \
    -o getoptions.o -c getoptions.c

# opt --enable-new-pm=0 -load ../../instrument-test/instrument-pass.so -instrument-test -debug-only=instrument-test -S fft.ll -o fft-inst.ll
# opt --enable-new-pm=0 -load ../../instrument-test/instrument-pass.so -instrument-test -debug-only=instrument-test -S getoptions.ll -o getoptions-inst.ll

# # -ftapir=serial -O3 is necessary to compile with tapir lowered & parallelism 
# clang -gdwarf-2 -ftapir=serial -O3 -o fft.o -c fft-inst.ll
# clang -gdwarf-2 -ftapir=serial -O3 -o getoptions.o -c getoptions-inst.ll

clang++ -gdwarf-2 -fforkd=lazy -ftapir=serial -fuse-ld=lld ../../uli-runtime/ext_lib/libpfm_build/lib/libpfm.a \
    -mllvm -lazy-poll-lowering=unwind-ulifsim \
    -mllvm -lazy-enable-proper-polling=0 \
    -mllvm -lazy-set-maxgrainsize=2048 -fpfor-spawn-strategy=1 \
    -mllvm -lazy-set-maxinstpoll=1 \
    --opencilk-resource-dir=../../cheetah/build/ \
    --gcc-toolchain=/afs/ece/project/seth_group/ziqiliu/GCC-12.2.0 \
    fft.o getoptions.o -lm -o fft \
    -L../../instrument-test/ -lInstrument

CILK_NWORKERS=1 LD_LIBRARY_PATH=/afs/ece/project/seth_group/ziqiliu/GCC-12.2.0/lib64:../../instrument-test ./fft -n 1300000 -r 2