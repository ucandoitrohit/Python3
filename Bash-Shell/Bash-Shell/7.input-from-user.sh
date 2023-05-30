#!/bin/bash
echo "This is Hello"

read name

echo "Output- ${name}"

read 
echo ${REPLAY}

read -p "Enter you age-" age
echo "out- ${age}"

read -p "Enter password-" -s password2
echo -e "\n\npass- ${password2}"
