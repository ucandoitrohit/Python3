#!/bin/bash
# How to pass argument to a function 
function install(){
    echo "Installing ${1} ${2}"
    echo "${0}"
  
}

configuration(){
      echo "running ${FUNCNAME}" 
    echo "Configure httpd ${1}"
      echo "ending ${FUNCNAME}"
}

function run {
    echo "run httpd ${1}"
}

install "apache nginx"
configuration "nginx"
run "web"
