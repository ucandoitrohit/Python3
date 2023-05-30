#!/bin/bash
echo "Command Output in a variable"

pwd
echo "============================"

cwd="pwd"
echo ${cwd}

echo "============================"
#use ``  # old method
cwd=`pwd`
echo ${cwd}
echo "============================"

cwd=$(pwd)
echo ${cwd}


date +"%D-%T"
echo "============================"

dd=$(date +"%D-%T")
echo "${dd}"