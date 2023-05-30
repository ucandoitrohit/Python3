#!/bin/bash
cla=$#
if [ $cla -eq 2 ]
then
  x=$1
  y=$2
  re=$((x+y))
  echo "$re"
fi
