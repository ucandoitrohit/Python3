#!/bin/bash
# less than, greater than...etc
# -lt, -gt, -le, -ge, -eq, -ne
# <, >, <=, >=, ==, !=

a=210
b=20

if [[ $a -ne $b ]]; then
  echo "1: True"
else
  echo "1: False"
fi

if (( a != b )); then
  echo "2: True"
else
  echo "2: False"
fi
