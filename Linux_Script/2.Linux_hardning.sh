#!/bin/bash
Server=`hostname`

/bin/echo "Disabling unused services"
for i in nfs mdmonitor abrt-ccpp abrt-oops abrtd atd auditd cgconfig cgred cups haldaemon lvm2-monitor messagebus netconsole nfslock numad postfix rdisc restorecond rhnsd rngd rpcbind rpcgssd rpcidmapd rpcsvcgssd saslauthd smartd snmp ftp NetworkManager firewalld
do
/bin/systemctl disable  $i
done

############# Disabling IPV6 ##########################################
/bin/echo "Disabling IPV6"
/bin/echo NETWORKING_IPV6=no >> /etc/sysconfig/network
/bin/echo IPV6INIT=no >> /etc/sysconfig/network

/bin/echo "#################### Permissions  ########################## "
chown root:root /etc/passwd
chown root:root /etc/shadow
chown root:root /etc/group
chown root:root /etc/gshadow
chmod 644 /etc/passwd
chmod 644 /etc/group
chmod 400 /etc/shadow
chmod 400 /etc/gshadow
chmod 600 /var/log/maillog
chmod 600 /var/log/messages
chmod 600 /var/log/secure
chmod 600 /var/log/boot.log
chmod 600 /etc/crontab
/bin/echo "#################### Permissions sets  ########################## "

/bin/echo "##### Setting Password Policy #####"
/bin/cp -p /etc/login.defs{,_orig_$(date +%b-%d-%m-%Y_%H%M)}
/bin/sed -i s/"PASS_MAX_DAYS\t99999"/"PASS_MAX_DAYS\t90"/ /etc/login.defs
/bin/sed -i s/"PASS_MIN_DAYS\t0"/"PASS_MIN_DAYS\t30"/ /etc/login.defs
/bin/sed -i s/"PASS_MIN_LEN\t5"/"PASS_MIN_LEN\t10"/ /etc/login.defs
/bin/echo "##### Password Policy has set #####"

/bin/echo "##### SELinux & Firewall and Networkmanager Policy Disabled #####"
/bin/cp -p /etc/selinux/config{,_orig_$(date +%b-%d-%m-%Y_%H%M)}
/usr/sbin/setenforce 0
/bin/sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
/bin/systemctl stop firewalld
/bin/systemctl stop NetworkManager
/bin/systemctl stop postfix
/bin/echo "#####################  Completed  ##############################"

/bin/echo "####################Changing default run level##################"
/bin/systemctl set-default multi-user.target
/bin/echo "####################Changed default run level##################"

/bin/echo "####################Setting up login banner##################"
/bin/echo "
*****************************************************************
*****************************************************************
                    -------------
                    Warning Message:
                    -------------
########## THIS IS A PRIVATE COMPUTER SYSTEM. ###################
#################################################################
	Unauthorized access to this device or the attached
	networks is prohibited without express written
	permission. Violators will be prosecuted to the
	fullest extent of both civil and criminal law.
###################################################################" > /etc/issue

/bin/echo "#####Set Daily Log rotation policy for 30 Days maximum #####"
/bin/cp -p /etc/logrotate.conf{,_orig_$(date +%b-%d-%m-%Y_%H%M)}
/bin/sed -i 's/weekly/daily/g' /etc/logrotate.conf
/bin/sed -i 's/rotate 4/rotate 30/g' /etc/logrotate.conf
/bin/systemctl restart rsyslog
/bin/echo "#####Log Rotaion policy has enabled successfuly#####"

/bin/echo "#####Setting History with Date and Time #####"
/bin/echo -e "export HISTTIMEFORMAT=\"%H:%M:%S %Y-%m-%d \"" >> /etc/profile
/bin/sed -i 's/HISTSIZE=1000/HISTSIZE=5000/g' /etc/profile
/bin/echo "#####History Date and Time has set#####"

/bin/echo "##### SSH DISABLED USEDNS OPTION NO #####"
/bin/cp -p /etc/ssh/sshd_config{,_orig_$(date +%b-%d-%m-%Y_%H%M)}
/bin/echo "Banner /etc/issue" >> /etc/ssh/sshd_config
/bin/echo "UseDNS no" >> /etc/ssh/sshd_config
/bin/echo "IgnoreRhosts yes" >> /etc/ssh/sshd_config
/bin/echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config
/bin/systemctl restart sshd
/bin/echo done

/bin/echo "#####  Monitoring users account   #####"
/bin/systemctl enable psacct
/bin/systemctl start psacct
/bin/echo done

/bin/echo "#####Cron permission to only root USER#####"
/bin/cp -p /etc/cron.deny{,_orig_$(date +%b-%d-%m-%Y_%H%M)}
/bin/touch /etc/cron.allow
/bin/cp -p /etc/cron.allow{,_orig_$(date +%b-%d-%m-%Y_%H%M)}
/bin/echo "root" >> /etc/cron.allow
/bin/echo "zimbra" >> /etc/cron.allow
/bin/systemctl restart crond
/bin/echo "#####Cron has allowed to ROOT user only#####"

/bin/echo "#####Setting password complexity#####"
authconfig --enablereqlower --update
authconfig --enablerequpper --update
authconfig --enablereqdigit --update
authconfig --enablereqother --update
/bin/echo "#####Password complexity setting done#####"

/bin/echo "##### Setting kernel swappiness #####"
/bin/echo "vm.swappiness=0" >> /etc/sysctl.conf
/sbin/sysctl -p
/bin/echo "#################### Done  ##########################"

#### Enable SYN Flood Attack ######
/bin/echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf
/usr/sbin/sysctl -p
#### Done ####

######## Removing postfix ########
/bin/rpm -e postfix
######## done ############

/bin/sed -i 's/no/yes/g' /etc/audisp/plugins.d/syslog.conf
/usr/bin/cat << EOF >> /etc/rsyslog.conf 
:programname, startswith, "spice-vdagent"       /var/log/spice-vdagent.log;SpiceTmpl
*.info;mail.none                                /var/log/rsyslog
.warn;.err                                      /var/log/rsyslog
auth.*,user.*;daemon.none                       /var/log/loginlog
kern.*                                          /varlog/kernel
*.alert                                         root
EOF

systemctl restart rsyslog.service

###############Installing Screen Sysstat telnet ###########################


yum -y install screen sysstat telnet 

############Setting Kernel Parameters############################################

echo "net.ipv4.tcp_fin_timeout=15" >> /etc/sysctl.conf
echo net.ipv4.tcp_tw_reuse=1 >> /etc/sysctl.conf
echo net.ipv4.tcp_tw_recycle=1 >> /etc/sysctl.conf
echo vm.swappiness=0 >> /etc/sysctl.conf

###################################################################################

