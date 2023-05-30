#!/bin/bash

# check file is directory -d
# check block device    -b
# check char device     -c  
# check file is exists  -e
# check file exist in regular -f
# read permission   
# write permission
# execute permission

dir="/e/python_repo/Python3/Bash-Shell/Bash-Shell"
if [ -d $dir ]
then
    echo ""
fi
echo "=================================================="

dir="/e/python_repo/Python3/Bash-Shell/Bash-Shell"
if [ -d $dir ]
then
    echo "${dir} is a dir"
else
        echo "not"

fi
echo "=================================================="
dir="/e/python_repo/Python3/Bash-Shell/Bash-Shell"
if [ -d $dir ]
then
    echo ""
fi
echo "=================================================="
