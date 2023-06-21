#!/bin/bash

file_animals="animals.txt"

# Method 1
echo "While Method 1: ------------------"
cat $file_animals | while read abc; do
  if [[ $abc = "tiger" ]]; then
    echo "Found the tiger!"
    exit
  fi
  echo $abc
done

# Method 2
echo "While Method 2: ------------------"
while read abc; do
  if [[ $abc = "cow" ]]; then
    echo "Found the cow!"
    exit
  fi
  echo $abc
done < $file_animals
