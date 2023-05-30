#!/bin/bash
echo "Command Line Argument"

name="rohit"
age="54"


echo "My Name is ${name} and age is ${age}"


name1=${1} 
age1=${2}

echo "My Name is ${name1} and age is ${age1}"
echo ${1}
echo ${2}
echo ${3}
echo ${4}
echo ${5}
echo ${6}
echo ${7}

echo "==================================="
echo $#  #--- print total cmd line argument
echo "==================================="

echo $@  # it work as seperate word
echo "==================================="

echo $*  # it work as single string
