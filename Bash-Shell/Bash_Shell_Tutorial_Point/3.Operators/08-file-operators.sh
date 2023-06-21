#!/bin/bash

# Check if a file exists

if [[ -a /etc/passwd ]]; then
  echo "1: The file is found!"
else
  echo "1: The file is not found!"
fi

if [[ -f /etc/passwd ]]; then
  echo "2: The file is found!"
else
  echo "2: The file is not found!"
fi

if [[ -s ./myfile.txt ]]; then
  echo "3: The file is found and is not empty!"
else
  echo "3: The file is not present or it is empty!"
fi

# Check if a directory exists
if [[ -d /etc/ ]]; then
  echo "4: The file is a directory!"
else
  echo "4: The file is NOT a directory!"
fi

# Check if you have permissions
# r, w, x
if [[ -w ./passwd.txt ]]; then
  echo "5: You have read perm!"
else
  echo "5:  You do not have read perm!"
fi

# Check if you are the owner/group
if [[ -O /etc/passwd ]]; then
  echo "6: You are the owner of the file!"
else
  echo "6: You are not the owner of the file!"
fi

if [[ -G /etc/passwd ]]; then
  echo "7: You are the member of the group!"
else
  echo "7: You are not a memnber of the group!"
fi

# newer/older
if [[ /etc/passwd -nt ./passwd.txt ]]; then
  echo "8: Newer"
else
  echo "8: Not Newer"
fi

if [[ /etc/passwd -ot ./passwd.txt ]]; then
  echo "9: Older"
else
  echo "9: Newer"
fi
