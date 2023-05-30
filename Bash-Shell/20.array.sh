#!/bin/bin

 arr=($(date))
[root@ldapclient script]# echo $arr
Wed
[root@ldapclient script]# echo ${arr[@]}
Wed May 10 03:06:29 EDT 2023
[root@ldapclient script]# echo ${#arr[@]}
6
[root@ldapclient script]# ls=($(ls))
[root@ldapclient script]# echo $ls
break-while.sh
[root@ldapclient script]# echo ${ls[@]}
break-while.sh cmd.sh continue-for.sh di.sh guess-number-for-loop.sh guess-number.sh if-else.sh info.csv loop.sh path.sh printf.sh sc.sh select-loop.sh serverinfo.sh tem.sh
[root@ldapclient script]#
