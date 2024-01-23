#!/bin/bash

d=`date +%d.%m.%y_%H:%M_Uhr`
logfile=/var/log/cronjobs/mysqlbackups.log
PW=Streuner!79
BACKUP_PATH=/var/backups/mysql

echo "Last Run: $d" | tee -a $logfile

i=`mysqlshow -h localhost -u root --password=${PW} | grep -v -- -- | grep -v Databases | grep -v information_schema | grep -v mysql | grep -v performance_schema | cut -f 2 -d \| |xargs`

for i in $i
    do
        mysqldump -h localhost -u root --password=${PW} $i > ${BACKUP_PATH}/${d}_${i}.sql | tee -a $logfile
	code=$?
	gzip -9 ${BACKUP_PATH}/${d}_${i}.sql | tee -a $logfile
	echo "MySql-Backup von $i erfolgreich durchgefuert - Returncode $code" | tee -a $logfile
    done

find ${BACKUP_PATH} -mtime +14 -exec rm {} \;

echo "MySQL Backup wurde am $d ausgeführt" | mailx -s "paqo.de cronjob 'MySQL-Backup am $d'" sandro.isoletta@gmail.com
