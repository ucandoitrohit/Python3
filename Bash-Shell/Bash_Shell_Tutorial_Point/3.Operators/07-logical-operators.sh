#!/bin/bash

# && - Logical AND
# || - Logical OR
# !  - Logical NOT

a=10
b=20
c=30

if [[ "$a" -eq 100 || "$b" -eq 200 ]]; then
  echo "1: True"
else
  echo "1: False"
fi

if (( !(a == 10) )); then
  echo "2: True"
else
  echo "2: False"
fi
