#!/bin/bash

file_animals="animals.txt"

for number in 1 2 3 4 5;do
  echo "Number : $number"
done

echo "1: ------------------"
for line in $(cat $file_animals);do
  if [[ $line = "cow" ]]; then
    sleep 2
  fi
  echo $line
done

echo "2: ------------------"
for line in `cat $file_animals`;do
  if [[ $line = "tiger" ]]; then
    exit
  fi
  echo $line
done
