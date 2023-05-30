#!/bin/bash
echo "Readonly varaible"

name="rohit"
echo ${name}


name="ram"
echo ${name}
# value will change

readonly name
name="tom"
echo ${name}

#how to unset value
unset name
    