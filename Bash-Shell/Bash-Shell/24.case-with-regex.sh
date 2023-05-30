#!/bin/bash

action=${1}

case ${action} in 
    start | START )
        echo "Start";;
    stop | STOP )
        echo "Stop";;
    restart | RESTART )    
        echo "restart";;
    reload | RELOAD)    
        echo "reload";;
    *)
        echo "wrong input";;    
esac

# or

action=${1,,}

case ${action} in 
    start )
        echo "Start";;
    stop )
        echo "Stop";;
    restart )    
        echo "restart";;
    reload)    
        echo "reload";;
    *)
        echo "wrong input";;    
esac