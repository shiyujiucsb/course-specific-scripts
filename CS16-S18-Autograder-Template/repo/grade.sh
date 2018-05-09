#!/bin/sh

cp /autograder/submission/hello.cpp .

if [ -d EXECUTION-FILES ]; then   
    cp EXECUTION-FILES/* .
fi

if [ -d BUILD-FILES ]; then   
    cp BUILD-FILES/* .
fi

make -s clean
make hello

rm -f results.json
DIFF_TOOLS=gs-diff-based-testing
chmod u+x ${DIFF_TOOLS}/grade-diffs.py
${DIFF_TOOLS}/grade-diffs.py diffs.sh 

if [ -d /autograder/results ]; then
    cp results.json /autograder/results/results.json
fi

make -s clean
