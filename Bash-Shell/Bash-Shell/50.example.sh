#!/bin/bash
if [ "$#" -eq 0 ] ; 
then
  echo -e "No argument."
  echo -e "Write a number between 1 and 12."
  exit 1
elif [ "$#" -gt 1 ] ;
then
  echo -e "More than 1 argument."
  echo -e "Write a number between 1 and 12."
  exit 1
else
  numb=$1
  case "$numb" in
    1) echo "Month: January";;
    2) echo "Month: February";;
    3) echo "Month: March";;
    4) echo "Month: April";;
    5) echo "Month: May";;
    6) echo "Month: June";;
    7) echo "Month: July";;
    8) echo "Month: August";;
    9) echo "Month: September";;
   10) echo "Month: October";;
   11) echo "Month: November";;
   12) echo "Month: December";;
    *) echo -e "You wrote a wrong number. Try again with writing number between 1 and 12.";;
  esac
fi
exit 2
exit 0