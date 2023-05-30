#!/bin/bin
ran=$RANDOM
for rr in 1 2 3
do
  read -p "Guess $rr your number: " number
  if [ $number -eq $ran ]
  then
    echo "correct"
  else
    echo "not correct"
  fi
done
