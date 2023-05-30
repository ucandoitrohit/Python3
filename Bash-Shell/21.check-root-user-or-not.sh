#!/bin/bin

if [ $(whoami) != "root" ]
then
  echo "Please run this script from root user"
fi

if [ $(id -u) -ne 0 ]
then

  echo "Please run this script from root user"
fi


yum install httpd -y
