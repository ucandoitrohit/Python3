#!/usr/bin/bash
PATH ="/"
HOSTNAME = $(hostname)
CRITICAL = 98
WARNING = 80
CRITICALMAIL = "yourmailid@gmail.com"
MAILWAR = "yourmailid@gmail.com"
mkdir -p /var/log/cpu-utilization
LOGFILE = /var/log/cpu-utilization/cpuusage-`date +%h%d%y`.log
touch LOGFILE
for path in $PATHS
do
    CPULOAD = `top -b -n 2 -d1 | grep "Cpu(s)" | tail -n1 | awk '{print $2}' | awk -F . '{print $1}'`
if [ -n $WARNING -a -n $CRITICAL ]; then
if [ "$CPULOAD" -ge "$WRANING" -a "$CPULOAD" -lt "$CRITICAL" ]; then
echo "`date "+%F %H:%M:%S"` WRANING - $CPULOAD on host $HOSTNAME" >> $LOGFILE
echo "Warning CPULOAD $CPULOAD Host is $HOSTNAME" | mail -s "CPULOAD is warning" $MAILWAR
exit 1
elfi [ "$CPULOAD" -ge "$CRITICAL" ]; then
echo "`date "+%F %H:%M:%S"` WRANING - $CPULOAD on host $HOSTNAME" >> $LOGFILE
echo "Critical CPULOAD $CPULOAD Host is $HOSTNAME" | mail -s "CPULOAD is Critical" $CRITICALMAIL
exit 2
else
echo "`date "+%F %H:%M:%S"` OK - $CPULOAD on host $HOSTNAME" >> $LOGFILE
exit 0
fi
fi
done