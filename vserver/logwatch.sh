#!/bin/bash
d=`date +%d.%m.%y`
t=`date +%H:%M_Uhr`
logfile=/var/log/cronjobs/logwatch.log

logwatch --detail high --range yesterday --format html --filename /var/www/logwatch/$(date +%F).html
chown www-data:www-data /var/www/logwatch/*.html

echo "Last Run: $d" | tee -a $logfile

echo "Logwatch wurde am $d um $t erfolgreich ausgeführt" | mailx -s "paqo.de cronjob 'Logwatch ausgeführt am $d um $t'" sandro.isoletta@gmail.com
