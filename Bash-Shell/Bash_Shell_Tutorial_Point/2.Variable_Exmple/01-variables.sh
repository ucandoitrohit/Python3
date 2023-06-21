#!/bin/bash
# Demo: Variables - Basics

course_name1="Bash Shell Scripting"
course_name1="Linux Command Line"

echo "1: Welcome to the course - ${course_name1}"

readonly course_name2="Mastering Linux Command Line"
#course_name2="Python Scripting"
echo "2: Welcome to the course - ${course_name2}"

course_name3="AWS VPC"
unset course_name3
echo "3: Welcome to the course - ${course_name3}"

set -u
course_name4="Mastering SSH"
unset course_name4
#echo "4: Welcome to the course - ${course_name4}"

set +u
course_name5="Mastering VirtualBox"
unset course_name5
echo "5: Welcome to the course - ${course_name5}"
