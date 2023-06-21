#!/bin/bash
# sleep continue break exit

a=0

echo "Before the for loop....."

for x in $(seq 5);do
  echo "For Loop : $x"
  if [[ $x -eq 3 ]]; then
    echo ">>>>> Inside the if condition"
    exit
  fi
  echo "     Inside For Loop: Hello 1"
  echo "     Inside For Loop: Hello 2"
done

echo "After the for loop....."
