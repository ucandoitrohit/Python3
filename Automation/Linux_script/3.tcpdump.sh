#!/bin/bash

mkdir -p /var/log/tcpdump
#pkill tcpdump;

/usr/sbin/tcpdump -i any -s 4096 > /var/log/tcpdump/capture_$(date +%Y-%M-%d-%H:%M:%S).log &
sleep 300; pkill tcpdump;
