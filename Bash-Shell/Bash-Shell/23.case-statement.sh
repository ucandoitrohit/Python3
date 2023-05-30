#!/bin/bash

action=${1}

case ${action} in 
    start)
        echo "Start";;
    stop)
        echo "Stop";;
    restart)    
        echo "restart";;
    reload)    
        echo "reload";;
    *)
        echo "wrong input";;    
esac