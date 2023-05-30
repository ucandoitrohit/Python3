
#!/bin/bin
read -p "Enter the action start | stop:-" action
if [ "${action}" == "start" ]
then
  systemctl start httpd
fi


if [ "${action}" == "stop" ]
then
  systemctl stop httpd
fi

systemctl status httpd
