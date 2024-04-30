opt -load libInlinerPrrPrinter.so -load-pass-plugin libInlinerPrrPrinter.so \
    -passes="inline-prr" ./delaunayTriangulation/delaunayTime/inliner-1.ll\
    --disable-output 