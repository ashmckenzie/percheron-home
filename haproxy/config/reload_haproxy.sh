#!/bin/sh

echo "INFO: Reloading HAProxy"

current_pid=$(pgrep -n -f '/usr/sbin/haproxy')

iptables -I INPUT -p tcp --dport 80 --syn -j DROP
sleep 1
/usr/sbin/haproxy -V -db -f /etc/haproxy/haproxy.cfg -st ${current_pid} &
sleep 1
iptables -D INPUT -p tcp --dport 80 --syn -j DROP

echo "INFO: Reloaded HAProxy"
