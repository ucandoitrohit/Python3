#!/bin/bash

while [[ $answer != "y" ]]
do
    echo "you enter ${answer}"
    read -p "please answer " answer
done



num=1
while [[ ${num} -lt 10 ]]
do
    echo ${num}
    ((num++))
done

read -p "enter num " numm
num=1
while [[ ${num} -lt 10 ]]
do
    echo $((num*numm))
    ((num++))
done