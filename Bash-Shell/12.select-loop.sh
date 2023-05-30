#!/bin/bin
select opt in Add Sub Mul Div Quit
do
  case $opt in
  Add)
    read -p "Enter num: " a
    read -p "Enter num: " b
    echo "$((a+b))"
    ;;
  Sub)
    read -p "Enter num: " a
    read -p "Enter num: " b
    echo "$((a+b))"
    ;;
  Mul)
    read -p "Enter " a
    read -p "Enter " b
    echo "$((a*b))"
    ;;
  Quit)
    exit 0
    ;;
  *)
    echo "Invalid"
    ;;
  esac

done
