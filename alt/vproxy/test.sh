#!/bin/bash
grep -v 172.24.30.12 /var/log/squid3/access.log > /root/skripte/temp
grep 172.24.30.120 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.121 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.122 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.123 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.124 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.125 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.126 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.127 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.128 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.129 /var/log/squid3/access.log >> /root/skripte/temp
cat /root/skripte/temp > /var/log/squid3/access.log
rm /root/skripte/temp
sleep 1
grep -v 172.24.30.12 /var/log/squid3/access.log.1 > /root/skripte/temp
grep 172.24.30.120 /var/log/squid3/access.log.1 >> /root/skripte/temp
grep 172.24.30.121 /var/log/squid3/access.log.1 >> /root/skripte/temp
grep 172.24.30.122 /var/log/squid3/access.log.1 >> /root/skripte/temp
grep 172.24.30.123 /var/log/squid3/access.log.1 >> /root/skripte/temp
grep 172.24.30.124 /var/log/squid3/access.log.1 >> /root/skripte/temp
grep 172.24.30.125 /var/log/squid3/access.log.1 >> /root/skripte/temp
grep 172.24.30.126 /var/log/squid3/access.log.1 >> /root/skripte/temp
grep 172.24.30.127 /var/log/squid3/access.log.1 >> /root/skripte/temp
grep 172.24.30.128 /var/log/squid3/access.log.1 >> /root/skripte/temp
grep 172.24.30.129 /var/log/squid3/access.log.1 >> /root/skripte/temp
cat /root/skripte/temp > /var/log/squid3/access.log.1
rm /root/skripte/temp
