#!/usr/bin/env bash

BASE_DIR=/autograder
REPO_NAME=repo

mkdir -p ${BASE_DIR}
mv /autograder/source/${REPO_NAME} ${BASE_DIR}/${REPO_NAME}

if [ -f ${BASE_DIR}/${REPO_NAME}/MAKE-REFERENCE.sh ]; then
    echo "Installing software for submit.cs transition diff-based testing"
    apt-get install -y python3 python3-pip python3-dev
    pip3 install jsonschema
    pip3 install pytest
fi

# If there is an apt-get.sh file in the repo, install what is needed

if [ -f ${BASE_DIR}/${REPO_NAME}/apt-get.sh ]; then
    echo "Installing Linux requirements from ${REPO_NAME}/apt-get.sh"
    chmod u+x ${BASE_DIR}/${REPO_NAME}/apt-get.sh
    ${BASE_DIR}/${REPO_NAME}/apt-get.sh
else
    echo "No apt-get.sh found in repo"
fi

# If there is a requirements.txt file in the repo, Install python dependencies

if [ -f ${BASE_DIR}/${REPO_NAME}/requirements.txt ]; then
    echo "Installing Python requirements from ${REPO_NAME}/requirements.txt"
    pip install -r ${BASE_DIR}/${REPO_NAME}/requirements.txt
else
    echo "No requirements.txt found in repo"
fi

# If there is a requirements3.txt file in the repo, install python3 dependencies

if [ -f ${BASE_DIR}/${REPO_NAME}/requirements3.txt ]; then
    echo "Installing Python3 requirements from ${REPO_NAME}/requirements.txt"
    pip3 install -r ${BASE_DIR}/${REPO_NAME}/requirements3.txt
else
    echo "No requirements3.txt found in repo"
fi

echo \$REPO_NAME=${REPO_NAME}
pwd
cd ${BASE_DIR}/${REPO_NAME}
pwd

if [ -f MAKE-REFERENCE.sh ]; then
    echo "Running ./MAKE-REFERENCE.sh"
    chmod u+x ./MAKE-REFERENCE.sh
    ./MAKE-REFERENCE.sh
fi

if [ -d REFERENCE-SOLUTION ]; then
   echo "Removing REFERENCE_SOLUTION from container"
   rm -rf REFERENCE-SOLUTION
fi

