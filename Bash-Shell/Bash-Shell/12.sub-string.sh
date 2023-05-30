#!/bin/bash
echo "Convert string to Sub String"

string="abcdefhgijklabcmnopxyzqrstuvwxyz"

echo ${string:0}
echo ${string:1}

echo ${string:0:3}

echo ${string:-1}
echo ${string: -1}
echo ${string: -5}

echo ${string#a*c} # from starting , shortest match
echo ${string##a*c} # from starting, longest match

echo ${string%a*c} 
echo ${string%%a*c}

echo ${string/abc/xyz}
echo ${string//abc/xyz}

