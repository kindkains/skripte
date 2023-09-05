#!/bin/bash

#---------------------------- Variablen ------------------------------

x=7
d=`date +%d.%m.%y`
bak="/var/backups/system/"

#---------------------------------------------------------------------

sudo tar zcvf "${bak}"etc_${d}.tar.gz /etc/
sudo tar zcvf "${bak}"root_${d}.tar.gz /root/
sudo tar zcvf "${bak}"home_${d}.tar.gz /home/

echo "Backups die älter als ${x} Tage sind werden gelöscht"
find "${bak}" -mtime +${x} -exec rm {} \;
