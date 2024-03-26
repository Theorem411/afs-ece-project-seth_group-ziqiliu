# clang++ \
#     -ftapir=serial -fopencilk -mcx16 -O3 \
#     -mllvm -debug-only=opencilk \
#     --opencilk-resource-dir=../cheetah/build/ -std=c++17 -DNDEBUG -I . \
#     -S -emit-llvm simplepfor.cpp -o simplepfor.ll 
# # -mllvm -noinline-tasks=true\
# # -mllvm -print-before=loop-spawning-ti \
# clang++ \
#     -mllvm -noinline-tasks=true \
#     -fforkd=lazy \
#     -ftapir=serial \
#     -fpfor-spawn-strategy=1 \
#     -mcx16 -O3 \
#     --opencilk-resource-dir=../cheetah/build/ -std=c++17 -DNDEBUG -I . \
#     -S -emit-llvm simplepfor.cpp -o simplepfor-loopspawn.ll

# clang++ \
#     -mllvm -noinline-tasks=true -mllvm -print-after-all \
#     -fforkd=lazy -ftapir=serial -fpfor-spawn-strategy=1 -mcx16 -O3 \
#     --opencilk-resource-dir=../cheetah/build/ \
#     -std=c++17 -DNDEBUG -I . \
#     -c simplepfor.cpp -o simplepfor.o \
#     > simplepfor_print_after_all.ll 2>&1
# # -mllvm -filter-print-funcs=main.outline_pfor.cond.strpm.outer.ls1 \
# # clang++ \
# #     -mllvm -noinline-tasks=true -mllvm -print-after-all \
# #     -fforkd=lazy -ftapir=serial  -mcx16 -O3 \
# #     --opencilk-resource-dir=../cheetah/build/ \
# #     -std=c++17 -DNDEBUG -I . \
# #     -S -emit-llvm simplepfor.cpp -o simplepfor.ll \
# #     > simplepfor_after_all.ll 2>&1

clang++ -g \
    -ftapir=serial -flto -fpfor-spawn-strategy=1 -mcx16 -O3 \
    --opencilk-resource-dir=../cheetah/build/ \
    -std=c++17 -DNDEBUG -I . \
    simplepfor.cpp -S -emit-llvm -o simplepfor-ls.ll

# command to compile test cases to detach-reattach format with outline
clang++ -g -ftapir=serial -fpfor-spawn-strategy=1 -flto -fuse-ld=lld -O3  \
    --opencilk-resource-dir=../cheetah/build/ -Wall -O3 \
    simplepfor.cpp -S -emit-llvm -o simplepfor-ls.ll

clang -g -ftapir=serial -fpfor-spawn-strategy=1 -flto -fuse-ld=lld -O3  \
    --opencilk-resource-dir=../cheetah/build/ -Wall -O3 \
    fft.c -S -emit-llvm -o fft-ls.ll

# command to compile test cases to detach-reattach format only
clang++ -ftapir=serial -flto -fuse-ld=lld -O3  \
    --opencilk-resource-dir=../cheetah/build/ -Wall -O3 \
    simplepfor.cpp -S -emit-llvm -o simplepfor.ll

clang++ -ftapir=serial -flto -fuse-ld=lld -O3  \
    --opencilk-resource-dir=../cheetah/build/ -Wall -O3 \
    doublePfor.cpp -S -emit-llvm -o doublePfor.ll

clang -ftapir=serial -flto -fuse-ld=lld -O3  \
    --opencilk-resource-dir=../cheetah/build/ -Wall -O3 \
    fft.c -S -emit-llvm -o fft.ll

clang -ftapir=serial -flto -fuse-ld=lld -O3  \
    --opencilk-resource-dir=../cheetah/build/ -Wall \
    heat.c -S -emit-llvm -o heat.ll

clang++ -ftapir=serial -flto -fuse-ld=lld -O3  \
    --opencilk-resource-dir=../cheetah/build/ -Wall \
    callback.cpp -S -emit-llvm -o callback.ll
opt -enable-new-pm=0 -mem2reg -S callback.ll -o callback.ll

# visualize callgraph 
opt -enable-new-pm=0 -dot-callgraph -callgraph-heat-colors callback.ll > /dev/null
dot -Tpng callback.ll.callgraph.dot -o callback.png

opt -enable-new-pm=0 -dot-callgraph -callgraph-heat-colors fft-link.ll > /dev/null
dot -Tpng fft-link.ll.callgraph.dot -o fft.png

# visualize cfg
opt -enable-new-pm=0 -dot-cfg-only -callgraph-heat-colors simplepfor.ll
dot -Tpng .main.dot -o simplefor.main.png

# run prr pass & print out stats
opt --enable-new-pm=0 -S --prr -test=simplepfor simplepfor.ll -o simplepfor-pr.ll

opt --enable-new-pm=0 -S --prr -test=doublePfor doublePfor.ll -o doublePfor-pr.ll

opt --enable-new-pm=0 -S --prr -test=callback callback.ll -o callback-pr.ll

opt --enable-new-pm=0 -S --prr -test=fft fft.ll -o fft-pr.ll

opt --enable-new-pm=0 -S --prr -test=fib ./cilk5/fib.ll -o ./cilk5/fib-pr.ll