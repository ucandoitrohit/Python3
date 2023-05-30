#!/bin/bash
# If else
# man if
#man test
if echo "Hello">/dev/null
then
    echo "Success"
fi   
n=5
if [ $n -eq 5 ]
then
    echo "same"
fi
nn="rohit"
mm="rohit"
if [ "${nn} == ${mm}" ]
then
    echo "samed"
fi
# or

if [ ${nn} == ${mm} ]
then
    echo "samed winthout"
fi



if [[ ${nn} == ${mm} ]]
then
    echo "samed winthout"
fi

oo="boy"
if [[ -n $oo ]]
then
    echo "length of string non zero"
fi    


oo2=""
if [[ -z $oo2 ]]
then
    echo "length of string zero"
else
    echo "w"
fi    

echo "========================================="
num=9

if [[ ${num} -eq 10 ]]
then
    echo "num is 10"
elif [[ ${num} -lt 10 ]]
then
    echo "num is less then 10 "
else
    echo "num is gr then 10"
fi


echo "=============================="
#read -p "want to continue(Y/y/yes)" username
#if [[ ${username} == 'y' ]]

read -p "want to continue(Y/y/yes)" user
echo ${user}