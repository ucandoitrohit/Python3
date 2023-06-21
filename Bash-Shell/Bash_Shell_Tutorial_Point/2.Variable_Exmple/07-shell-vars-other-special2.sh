#!/bin/bash
# $#, $?, $$, $!, $*, $@

#Internal Field Seperator
IFS="|"

echo "Dolor-Star-- $*"
echo "Dolor-at-the-rate-- $@"

echo "$*"
echo "$@"

./05* "$*"
