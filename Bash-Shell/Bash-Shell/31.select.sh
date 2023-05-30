#!/bin/bash

'''
select os in linux windows mac
do
    echo "you select $os"
done
'''
select os in linux windows mac
do
    case ${os} in
    linux)
        echo "linux";;
    windows)
        echo "windows";;
    mac)
        echo "macbook";;
    *)
        echo "invalid"
        exit 0
    esac    
done


