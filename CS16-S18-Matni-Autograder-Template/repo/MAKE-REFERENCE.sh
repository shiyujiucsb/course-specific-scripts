#!/usr/bin/env bash

pip3 install jsonschema

DIFF_TOOLS=../gs-diff-based-testing

cd REFERENCE-SOLUTION

if [ -f ../Makefile ]; then
    cp -v ../Makefile .
fi

if [ -d ../EXECUTION-FILES ]; then   
    cp -v ../EXECUTION-FILES/* .
fi

if [ -d ../BUILD-FILES ]; then   
    cp -v ../BUILD-FILES/* .
fi

make -s clean
make 

chmod u+x ${DIFF_TOOLS}/grade-diffs.py
${DIFF_TOOLS}/grade-diffs.py -r ../diffs.sh 


