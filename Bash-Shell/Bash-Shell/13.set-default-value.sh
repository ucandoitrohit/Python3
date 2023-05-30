#!/bin/bash
echo "Set default value"
read -p "please enter name-" name
echo ${name}
echo "================================"

read -p "please enter name "name2
name2=${name2:-World}
echo ${name2}
echo "================================"

youname=${unsetname-Mon}
echo $youname
echo "================================"

myname=""
mytest=${myname-Kali}
echo ${mytest}

echo "================================"
mytest2=${myname2-Kali}
echo ${mytest2}
