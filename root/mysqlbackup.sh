#!/bin/bash

d=`date +%d.%m.%y_%H:%M_Uhr`
logfile=/var/log/cronjobs/mysqlbackups.log
echo "Last Run: $d" | tee -a $logfile

i=`mysqlshow -h localhost -u root --password=Streuner!79 | grep -v -- -- | grep -v Databases | grep -v information_schema | grep -v mysql | grep -v performance_schema | cut -f 2 -d \| |xargs`

for i in $i
    do
        mysqldump -h localhost -u root --password=Streuner!79 $i > /var/backups/mysql/${d}_${i}_mysql_backup.sql | tee -a $logfile
	code=$?
	gzip -9 /var/backups/mysql/${d}_${i}_mysql_backup.sql | tee -a $logfile
	echo "MySql-Backup von $i erfolgreich durchgefuert - Returncode $code" | tee -a $logfile
    done

find /var/backups/mysql -mtime +14 -exec rm {} \;
