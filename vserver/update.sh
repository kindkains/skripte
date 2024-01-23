#!/bin/bash
d=`date +%d.%m.%y`
t=`date +%H:%M`
logfile=/var/log/cronjobs/update.log

apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove -y

echo "Update wurde am $d um $t ausgeführt" | mail -s "paqo.de cronjob 'Update am $d'" sandro.isoletta@gmail.com
