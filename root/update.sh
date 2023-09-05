#!/bin/bash
d=`date +%d.%m.%y`
logfile=/var/log/cronjobs/update.log

echo "Last Run: $d" | tee -a $logfile

apt-get update | tee -a $logfile
apt-get upgrade -y | tee -a $logfile
echo "" | tee -a $logfile
echo "Returncode $?" | tee -a $logfile
echo "" | tee -a $logfile
