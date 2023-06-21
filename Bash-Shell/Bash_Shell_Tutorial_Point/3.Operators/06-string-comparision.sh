#!/bin/bash

#  =  Equal to
# !=  Not equal to
# -z  check if string is null (length = 0)
# -n  check if string is not null

string1="ubuntu"
string2="Linux"
string3=""

# Equality
if [[ "$string1" = "ubuntu" ]]; then
  echo "True"
else
  echo "False"
fi

# Inquality
if [[ "$string1" != "$string3" ]]; then
  echo "True"
else
  echo "False"
fi

#check if the string is null
if [[ -z "$string3" ]]; then
  echo "True"
else
  echo "False"
fi

# check if string is not null
if [[ -n "$string3" ]]; then
  echo "True"
else
  echo "False"
fi
