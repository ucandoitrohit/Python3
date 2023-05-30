#!/bin/bash

function installPackage(){
    local packageName=${1}
    if ! yum  install -y ${packageName}
    then
        echo "not able to install ${packageName}."
    fi
}

function mavenTarget(){
    local mavenCmd=${1}
    if [[ $? == 0 ]]
    then
        echo "${mavenCmd} Success."
    else
        echo "${mavenCmd} Fail."
        exit 1
}