#!/bin/bash
a=100
b=20

#1 test same as [ condition ]
if test $a -gt $b;then
  echo "1: a is greater than b"
else
  echo "1: a is less than b"
fi

if [ $a -gt $b ];then
  echo "2: a is greater than b"
else
  echo "2: a is less than b"
fi

#2 [[ condition ]]
if [[ $a -gt $b ]];then
  echo "3: a is greater than b"
else
  echo "3: a is less than b"
fi

#3 (( condition ))
if (( a > b )) ;then
  echo "3: a is greater than b"
else
  echo "3: a is less than b"
fi

#4 ( command )
if ( ps ) ;then
  echo "4: a is greater than b"
else
  echo "4: a is less than b"
fi
