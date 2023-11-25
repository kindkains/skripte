#!/bin/sh

d=`date +%d%m%y`
i=`mysqlshow -h localhost -u root --password=zV0WgCb5 | grep -v -- -- | grep -v Databases | grep -v information_schema | grep -v mysql | grep -v performance_schema | cut -f 2 -d \| |xargs`

for i in $i
    do
        mysqldump -h localhost -u root --password=zV0WgCb5 $i > /var/backups/mysql/$i-mysql-backup-$d.sql
		gzip -9 /var/backups/mysql/$i-mysql-backup-$d.sql
    done

find /var/backups/mysql -mtime +14 -exec rm {} \;
#find /var/backups/mysql/ -type f -mtime +14 -delete
#find /var/backups/mysql/ -ctime 14 -delete
echo "MySql-Backup vom $d wurde erfolgreich durchgeführt!" >> /var/backups/mysql/backup.log
echo "" >> /var/backups/mysql/backup.log
