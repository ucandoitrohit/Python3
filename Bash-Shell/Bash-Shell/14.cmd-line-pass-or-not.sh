#!/bin/bash
echo "Check Command line variable passwd or not"

name="rohit"
: ${name:?"please set vari-"}

echo "i am ahere"


: ${1:?"please set vari-"}
