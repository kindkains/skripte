#!/bin/bash
d=`date +%d.%m.%y`
t=`date +%H:%M_Uhr`
logfile=/var/log/cronjobs/logwatch_30.log

logwatch --detail low --range 'between 30 days ago and yesterday' --filename /var/www/logwatch/$(date +%F).html
logwatch --detail low --range 'between 30 days ago and yesterday' --mailto nobody@ubuntuusers.de
chown www-data:www-data /var/www/logwatch/*.html

echo "Last Run: $d" | tee -a $logfile

echo "Logwatch_30 wurde am $d um $t erfolgreich ausgeführt." | mailx -s "paqo.de cronjob 'Monatlicher Logwatch ausgeführt am $d um $t'" sandro.isoletta@gmail.com
