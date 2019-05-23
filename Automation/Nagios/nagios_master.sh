#!/bin/bash
clear
`rm -rf file_name_ip`
echo ""
echo "Provide the sequence of file number example:-(gkdb01...gkdb05):-"
echo ""
read -p "Provide the first sequence of startng number :-" num1
read -p "Provide the last  sequence of starting number :-" num2
echo ""
read -p "Provide the file name which you want to copy example ( gkdb01.cfg ):-" file1
echo ""
if [ -f `pwd`/$file1 ]; then
	echo "'$file1' file exists at this location `pwd`"
	echo ""
	NAME=`echo $file1 | awk -F"." '{print $1}' | tr -dc 'a-z'`
	for i  in $(seq -f "%02g" ${num1} ${num2})
	do 
		`cp $file1 $NAME$i.cfg`
		echo $NAME$i.cfg
		FILE="/etc/hosts"
		IP=`cat $FILE | grep -w $NAME$i | awk '{print $1}'`
		echo $NAME$i.cfg >> file_name_ip $IP
	 done
		echo ""
		echo "Copy has been done..."
		echo ""
else
	echo ""
	echo "'$file1' file doesn't exists at this location"
	echo ""
fi

while read host ip
do
HOST=`echo $host | awk -F "." {'print $1'}`
HOSTR=`cat $host | grep -i host_name | tail -n 1 | awk '{print $2}'`
IPO=`cat $host | grep -i address | awk '{print $2}'`
IPR=`echo $ip`
sed -i "s/$HOSTR/$HOST.nic.in/g" $host
sed -i "s/$IPO/$IPR/g" $host
done < file_name_ip

##################Adding hostname in Hostgroup.cfg#################################
MAKE="/usr/local/nagios/etc/objects/hostgroup.cfg"
read -p "Grep the hostname from Hostgroup.cfg file type ( gms075.nic.in) :- " host
echo " "
HOST=`egrep $host $MAKE | awk '{print $NF}'`
echo "Last string of the hostgroup" $HOST
echo " "
NEW=`cat file_name_ip | awk '{print $1}' | awk 'BEGIN{ ORS=" " }{ print }' | awk '{for(i=1;i<NF;i++)if(i!=NF){$i=$i","} }1'`

ADD=`sed -i "s/\<$HOST\>/&, $NEW/" $MAKE`

CHANGE=`sed -i "s/cfg/nic.in/g" $MAKE`

grep $host $MAKE
echo " "
