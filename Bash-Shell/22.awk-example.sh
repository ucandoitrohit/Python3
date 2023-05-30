#!/bin/bin

# AWK
# syntax
# awk options 'pattern/condition {action}' filename
# command | awk options 'pattern/condition {action}'

# awk can take the following options
# -F fs -- to specify a field separator
# -v var=value  -- to declare a variable
# -f file -- to specify a file that contains awk script


# awk 'BEGIN {start_action} pattern/condition{action}END{stop_action}' filename
# awk -f awk_script.awk filename

awk '{print $0 }' /etc/passwd
echo "******************************"
awk '/root/ {print $0 }' /etc/passwd

echo "******************************"
awk 'NR>=3 { print NR, $0 }' /etc/passwd

echo "=============================================="

# awk 'BEGIN {start_action} pattern/condition{action}END{stop_action}' filename
# BEGIN  block is performed before reading the file
# END    block is performed after  processing the file


#Note
# Need at least one action to run awk script
# No need of input for BEGIN action
# input is required only for middile action and END actions


# example

awk 'BEGIN { print "======Working on /etc/passwd file======"} /root/ { print $0 } END { print "=====Copleted script=====" }' /etc/passwd
