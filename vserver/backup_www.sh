#!/bin/bash

#---------------------------- Variablen ------------------------------

x=7
d=`date +%d.%m.%y`
bak="/var/backups/www/"
folder=(pgp bilder coppermine git_kurs wiki.bak pokora rpg php skripte paqo.de meerwasserwiki engel traumtagebuch inka-online bash_skript html forum wiki phpvirtualbox-5.0-5 letsencrypt shadowwiki spielwiese)
logfile=/var/log/cronjobs/www_backup.log

#---------------------------------------------------------------------

echo "Last Run: $d" | tee -a $logfile

cd $bak

for i in ${folder[@]}; do

	echo "$i wird nach ${bak}${i} gepackt" | tee -a $logfile
	tar -czf ${i}_${d}.tar.gz /var/www/${i} | tee -a $logfile
	echo 
done

echo | tee -a $logfile

echo "Backups die älter als ${x} Tage sind werden gelöscht" | tee -a $logfile
find "${bak}" -mtime +${x} -exec rm -v {} \; | tee -a $logfile


echo "Backup aller www Ordner wurde am $d ausgeführt" | mailx -s "paqo.de cronjob 'www Backup am $d'" sandro.isoletta@gmail.com
