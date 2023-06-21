#!/bin/bash

# Variables
COURSE="Bash Shell Scripting"
SITE="GlobaleTraining.com"

# Functions
function gethostdetails {
  hostname
  ip addr show  | grep -v inet6 | grep inet | awk '{print $2}' | grep -v ^127
}
