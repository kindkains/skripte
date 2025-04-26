#!/bin/bash

#---------------------------- Variablen ------------------------------

x=5
d=`date +%d.%m.%y`
bak="/var/backups/"
folder=( $(find /var/www -type d -maxdepth 1 | awk -F / '{print$4}'))

#---------------------------------------------------------------------

cd $bak

for i in ${folder[@]}; do

	echo "$i wird nach ${bak}${i} gepackt"
	tar -czf ${i}_${d}.tar.gz /var/www/${i}
	echo

done

echo "Backups die älter als $x Tage sind werden gelöscht"
find /var/backups/ -mtime +$x -exec rm {} \;
