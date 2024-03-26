opt -load ./PrrStatistic.so -load-pass-plugin ./PrrStatistic.so -passes="prr-stats" -debug-only=prr -test=simplepfor ../test/simplepfor.ll --disable-output

opt -load ./PrrStatistic.so -load-pass-plugin ./PrrStatistic.so -passes="prr-stats" -debug-only=prr -test=doublePfor ../test/doublePfor.ll --disable-output

