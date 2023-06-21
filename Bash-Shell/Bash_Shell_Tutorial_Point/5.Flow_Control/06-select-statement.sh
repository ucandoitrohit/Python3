#!/bin/bash

echo
echo "Please select a desired OS: "
select os in ubuntu solaris hp-ux ibm-aix
do
  case $os in
    "ubuntu" ) echo "You selected ubuntu" ;;
    "solaris" ) echo "You selected solaris" ;;
    "hp-ux" ) echo "You selected hp-ux" ;;
    "ibm-aix" ) echo "You selected ibm-aix" ;;
  esac

done
