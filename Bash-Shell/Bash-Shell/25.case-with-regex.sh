#!/bin/bash

read -p "enter y or n" action

case ${action} in 
    [Yn]|[Yy][E][S])
        echo "Yes";;
    [Nn]|[Nn][Oo][NN])
        echo "No";;
    *)
        echo "invalid";;    
esac
