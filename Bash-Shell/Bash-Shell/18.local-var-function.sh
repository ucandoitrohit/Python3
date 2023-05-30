#!/bin/bash
# How to pass argument to a function 
pkgname="ngnix"
function install(){
    myname="rohit"
    echo "Installing ${1}"
}

configuration(){
    pkgname="tomcat"
    echo "Configure httpd ${1}"
}

echo "first ${pkgname}"
echo " myname = ${myname}"

install "${pkgname}"
echo " myname = ${myname}"
echo "second ${pkgname}"

configuration  "${pkgname}"
