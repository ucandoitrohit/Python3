#!/bin/bash
echo "name" | while read line
do
    echo "${line}"
done


echo -e "name is rohit \n sharma" | while read line
do
    echo "Lines are----> ${line}"
done


cat /e/python_repo/Python3/Bash-Shell/Bash-Shell/filename | while read line
do
    echo "$line"
done


while read line
do
    echo $line
done < /etc/passwd
