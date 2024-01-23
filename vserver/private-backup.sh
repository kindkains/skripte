#!/bin/bash

/root/skripte/mysqlbackup.sh

echo
quelle=(root docker home etc opt var\/www var\/backups usr\/local/bin)
ziel=private-backup/backup

for i in ${quelle[@]}; do
	echo "Sichere /$i/ /$ziel/$i/"
	sleep 3
	rsync -avPu --delete /$i/ /$ziel/$i/
done
