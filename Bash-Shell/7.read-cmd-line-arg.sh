#!/usr/bin/bash

#read -p "Enter number- " a
#read -p "Enter number- " b
a=$1
b=$2

sum=$a+$b
result=$(expr "$a + $b")
echo "Output- $result"

