#!/bin/bash

string1="Ubuntu 18.04"
string2="Bash Shell Scripting"
string3=""

echo "1:-----------------------"
echo ${string1:-Linux}
echo ${string1}

echo "2:-----------------------"
echo ${string1:=Linux}
echo ${string1}

echo "3:-----------------------"
#echo ${string3:?undefined}
echo ${string3}

echo "4:-----------------------"
echo ${string3:+1}
echo ${string3}

echo "5:-----------------------"
string4=123456789abcdefghijk
echo ${string4:9}
echo ${string4: -9}
echo ${string4:9:5}
echo ${string4:9: -2}
echo ${string4: -9: -2}
