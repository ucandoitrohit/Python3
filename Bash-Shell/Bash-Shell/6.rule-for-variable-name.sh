#!/bin/bash
_var="file"
echo "${_var}"

# never use digit for varaibe starting because it bash understand command line argument 
# 34var_name

# System Define varaible
env
echo $SHELL
echo $HOME
echo ${OSTYPE}
echo $PATH
echo ${$}  # print the process id
echo ${PPID} # prine the parent process id

echo ${PWD}
echo ${HOSTNAME}
echo ${UID}

#man bash
sleep 5
echo ${SECONDS}

