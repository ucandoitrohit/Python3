#!/bin/bash

declare myvar1
myvar1="Learnbing Bash"
echo "myvar1: $myvar1"
declare myvar2="Python"
echo "myvar2: $myvar2"

# Export
declare -x myvar1
declare -x myvar2
env | grep myvar

# Remove from env
declare +x myvar2
env | grep myvar

# integers
declare -i myvar3
myvar3=AWS
myvar3=20
echo "myvar3: $myvar3"

declare -i myvar4
myvar4="12*5"
echo "myvar4: $myvar4"

#readonly
declare -r myvar5="Learning"
myvar5="ABC"
echo "myvar5: $myvar5"

#upper case
declare -u myvar6="Learning"
myvar6="ABC"
echo "myvar6: $myvar6"

#lower case
declare -l myvar7="Learning"
myvar7="ABC"
echo "myvar7: $myvar7"
