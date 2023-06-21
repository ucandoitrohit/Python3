#!/bin/bash

a=10
b=3

sum=$(( a + b ))
echo "Sum : $sum"

sub=$(( a-b ))
echo "Substract : $sub"

multi=$(( a*b ))
echo "Multiply : $multi"

div=$(( a/b ))
echo "Division : $div"

mod=$(( a%b ))
echo "Modulus : $mod"
