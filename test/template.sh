clang++ -Xclang -disable-O0-optnone -O0 --opencilk-resource-dir=../cheetah/build/ \
    -mllvm --print-after-all -S -emit-llvm ./template.cpp -o template.ll 2> template.txt