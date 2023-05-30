#!/bin/bin
ran=$RANDOM
chance=1
for (( ; ; ))
do
  read -p "Guess $chance your number: " number
  if [ $number -eq $ran ]
  then
    echo "correct"
    break
  else
    echo "not correct"
    if [ $number -ge $ran ]
    then
        echo "select less"
    else
        echo "select higher"
    fi
  fi
chance=$((chance+1))
done
