#!/bin/bash


read -p "enter num " numm
num=1

until [[ ${num} -eq 10 ]]
do
    echo $((num*numm))
    ((num++))
done