#!/bin/bash
echo "Welcome to GlobaleTraining.com"

a=100
if [[ $a -eq 10 ]]; then
  echo "1: True"
else
  echo "1: False"
fi

compname=$(hostname)
if [[ $compname = "webdev-vm01" ]]; then
  echo "2: Hostname is set as desired!"
else
  echo "2: This is not webdev-vm01"
fi

read -p "Enter a number (1-100) : " score

if [[ $score -ge 60 && $score -le 100 ]]; then
  if [[ $score -lt 80 ]]; then
    echo "You got B-"
  elif [[ $score -le 85 ]]; then
    echo "You got B"
  elif [[ $score -gt 85 && $score -le 90 ]]; then
    echo "You got B+"
  elif [[ $score -gt 90 && $score -le 95 ]]; then
    echo "You got A"
  else
    echo "You got A+"
  fi
else
  if [[ $score -lt 1 || $score -gt 100 ]]; then
    echo "Please enter a value between 1 and 100!"
  fi
  if [[ $score -lt 60 ]]; then
    echo "Minimum score required is 60!"
  fi
fi
