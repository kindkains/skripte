#!/bin/bash

quelle=/private-backup/backup
# ziel=(root home etc/apache2 etc/ssh etc/mysql opt  var)
ziel=(root home opt var)

for i in ${ziel[@]}; do
	echo "Stelle $quelle/$i/ /$i/ wieder her"
	sleep 3
	rsync -avP $quelle/$i/ /$i/
done
