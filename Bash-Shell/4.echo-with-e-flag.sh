#!/usr/bin/bash

x=6
y=76
z=876

echo "Value are: - $x , Value are: - $y , Value are: - $z"
echo "========================================================"
echo "Value are: - $x  , \nValue are: - $y , \nValue are: - $z"
echo "========================================================"

echo -e "Value are: - $x  , \nValue are: - $y , \nValue are: - $z"

echo "========================================================"
echo "Coloring echo"
echo -e "\033[92mThis is example\033[0m"

#to execute any special characters use -e options

# need to use -e for using \n


# syyntax
# echo [options] string/$variable/$command
# options are
#
# -n ===> used to omit echoing trailing newline
# -e ===> used to execute special /escaped character

# escaped charater
# \n ---> newline
# \b ---> remove one space back from where it isused
# \t ---> tab space
# \r ---> to remove chrater
# \v ---> vertical tab space
# \a ---> sound alert
# \\ ---> escape or eliminate the special purpose of escaped character




