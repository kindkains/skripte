#!/bin/sh

check_mnt(){
	FILE=/media/$1/$1				# Die Datei, welche auf Existenz geprüft wird
	u=" Uhr"
	d=`date +%d.%m.%Y_%H:%M`$u

	if test -e $FILE; then
	   echo "$1 ist gemountet - Zeitstempel $d" >> /root/skripte/mount.log
	   return 0
	else
		echo "/media/$1 ist nicht gemountet, versuche die Festplatte einzuhängen:" >> /root/skripte/mount.log
		MNT="UUID=$2 /media/$1"
		mount $MNT
		if test $? -eq 0; then
	       	echo "Mount /media/$1 hat geklappt - Zeitstempel $d" >> /root/skripte/mount.log
	        return 1
	else
		echo "Mount /media/$1 hat nicht geklappt - Zeitstempel $d" >> /root/skripte/mount.log
	        return 2
	fi
	fi
}

check_net(){
	FILE=/$1/$2				# Die Datei, welche auf Existenz geprüft wird
	u=" Uhr"
	d=`date +%d.%m.%Y_%H:%M`$u

	if test -e $FILE; then
	   echo "$1 ist gemountet - Zeitstempel $d" >> /root/skripte/mount.log
	   return 0
	else
		echo "/$1 ist nicht gemountet, versuche die Festplatte einzuhängen:" >> /root/skripte/mount.log
		su sandro -c "mount $1"
		if test $? -eq 0; then
	       	echo "Mount $1 hat geklappt - Zeitstempel $d" >> /root/skripte/mount.log
	        return 1
	else
		echo "Mount $1 hat nicht geklappt - Zeitstempel $d" >> /root/skripte/mount.log
	        return 2
	fi
	fi
}
action(){
	if test $1 -eq 0; then
		echo "War schon eingehangen"
	else
		if test $1 -eq 1; then
			echo "War nicht eingehangen, konnte aber erfolgreich eingehangen werden"
		else
			echo "Fehler beim Einhängen, Festplatte nicht ereichbar!"
		fi
	fi
}

check_mnt HDD1 e6d25ccd-3019-4423-9080-3ba717afabff
	myCheck=$?
	action $myCheck
check_mnt HDD2 5c95d7db-1500-47ae-a215-b552ae1d2532
	myCheck=$?
	action $myCheck
check_mnt HDD3 1289e53e-0199-47da-8c91-46f7e620c117
	myCheck=$?
	action $myCheck
check_mnt HDD4 9b4675d4-e98b-4c38-9d1b-a7dd1c654187
	myCheck=$?
	action $myCheck
check_net "/data" storagebox
	myCheck=$?
	action $myCheck
echo "" >> /root/skripte/mount.log
