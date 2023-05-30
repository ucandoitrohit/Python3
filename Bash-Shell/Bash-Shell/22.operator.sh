#!/bin/bash
# Not or !
# AND or &&
# OR or ||

nn="rohit"
mm="rohit"

if [[ ! ${nn} !=  ${mm} ]]
then
    echo "same"
fi
echo "***************AND**************"

# os == linux && user == root
OS=$(uname)
if [[ ${OS} == "MINGW64_NT-10.0" ]]
then 
    echo "OS is Windows"
fi
echo "======================================"
OS=$(uname)
who=$(whoami)
if [[ ${OS} == "MINGW64_NT-10.0" ]]
then 
    if [[ $who -eq "lenovo" ]]
    then
        echo "user is root and os is linux"
    fi

fi
# or
echo "======================================"
OS=$(uname)
who=$(whoami)
if [[ ${OS} == "MINGW64_NT-10.0" && $who -eq "lenovo" ]]
then 
        echo "user is root and os is linux"
fi

echo "***************OR**************"
OS=$(uname)
who=$(whoami)
if [[ ${OS} == "MINGW64_NT-10.0" || ${who} -eq "lenovoa" ]]
then 
        echo "user is root ors os is linux"
fi

