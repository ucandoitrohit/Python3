#!/bin/bash
# $@ and $*

echo "==========loop 1================="

for i in $@
do
    echo $i
done

echo "==========loop 2================="
for i in $*
do
    echo $i
done

echo "==========loop 3================="

for i in "$@"
do
    echo $i
done

echo "==========loop 4================="
for i in "$*"
do
    echo $i
done