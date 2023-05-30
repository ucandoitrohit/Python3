#!/bin/bin
$path="/etc/httpd/conf/httpd.conf"

echo $path
#dirname $path
#basename $path


path2="/tmp/xyz/apache-tomcat-8.7.0.tar.gz"
basename $path2

echo "${path2#/tmp/}"
echo "${path2%.*}"
echo "${path2%%.*}"
echo "${path2#*.}"
echo "${path2##*.}"