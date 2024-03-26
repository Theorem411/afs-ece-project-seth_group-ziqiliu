#!/bin/bash

PRR_DSO=../../static-prr/PrrStatistic.so
# Check if a file name is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <name>"
    exit 1
fi

NAME=$1

# Apply the command to the specified file
# opt --enable-new-pm=0 -S -stats --prr ./cilk5/${NAME}.ll -o ./cilk5/${NAME}-pr.ll
opt -load $PRR_DSO -load-pass-plugin $PRR_DSO -passes="prr-stats" -test=${NAME} ./${NAME}.ll --disable-output
