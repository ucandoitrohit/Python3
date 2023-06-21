#!/bin/bash

echo "Loop 1: ---------------------"
for x in 1 2 3 4 5;do
  echo "For Loop 1 : $x"
done

echo "Loop 2: ---------------------"
for name in john mary kevin larry;do
  echo "For Loop 2 : $name"
done

echo "Loop 3: ---------------------"
for x in $(seq 4);do
  echo "For Loop 3 : $x"
done

echo "Loop 4: ---------------------"
for x in {0..20..5};do
  echo "For Loop 4 : $x"
done

echo "Loop 5: ---------------------"
for (( i = 0; i < 5; i++ )); do
  echo "For Loop 5 : $i"
done
