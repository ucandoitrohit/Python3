#!/bin/bin
# cut command is a powerfu tool to extract part of each line of a file is also called slicing
#syntax
# cut options <rang of bytes/charcater/fields> file
#or
# command options | cut options
# cut -b/-c/-f range of bytes/character/field filename
# command output | cut -b/-c/-f range of bytes/character/field
# cut -b ,position/range> file
# cut -c <position/range> file
#position: 3,5,10
#range: 3-7, 6-10

#example
cut -b 2 /etc/passwd
cut -b 3,7 /etc/passwd
cut -b 5-9 /etc/passwd
cut -b 5- /etc/passwd
cut -b -7,9 /etc/passwd

cut  -c 1 /etc/passwd
echo "==============================="
cut  -c 2-5 /etc/passwd

echo "==============================="
cut -d ':' -f 1 /etc/passwd

echo "==============================="
awk -F ':' '{print $1}' /etc/passwd

cut -d ":" -f 2 /etc/passwd

# cut -f <position/range> filename
# cut -f <position/range> [-d ":"] [--output-deimiter='**'] filename

cut -d ':' -f 1,6 --output-delimiter=" " /etc/passwd
cut -d ':' -f 1,6 --output-delimiter="----" /etc/passwd
