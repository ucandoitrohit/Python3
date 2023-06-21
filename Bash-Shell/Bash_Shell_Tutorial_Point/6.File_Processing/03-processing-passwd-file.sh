#!/bin/bash

# use the one attached to the lesson or your /etc/passwd
file_passwd="/etc/passwd"
# Ignore users with the following in the shell field
# /usr/sbin/nologin
# /bin/false
# 1 - user id
# 6 - Home dir
# 7 - shell

echo "------------ Using while loop ------------"
cat $file_passwd | while read user_line; do
  USER_ID=$(echo $user_line | cut -d: -f1)
  USER_HOMEDIR=$(echo $user_line | cut -d: -f6)
  USER_SHELL=$(echo $user_line | cut -d: -f7)

  if [[ $USER_SHELL != "/usr/sbin/nologin" && $USER_SHELL != "/bin/false" ]]; then
    echo "$USER_ID -- $USER_SHELL -- $USER_HOMEDIR"
  fi
done
echo
echo
IFS=$'\n'
echo "------------ Using for loop ------------"
for user_line in $(cat $file_passwd);do
  USER_ID=$(echo $user_line | cut -d: -f1)
  USER_HOMEDIR=$(echo $user_line | cut -d: -f6)
  USER_SHELL=$(echo $user_line | cut -d: -f7)

  if [[ $USER_SHELL != "/usr/sbin/nologin" && $USER_SHELL != "/bin/false" ]]; then
    echo "$USER_ID -- $USER_SHELL -- $USER_HOMEDIR"
  fi
done
