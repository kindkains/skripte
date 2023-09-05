#!/bin/bash

#FUNKTIONEN
certbot_start() {
	sudo certbot renew
	echo "Neues Zertifikat wurde generiert oder Zertifikat ist noch gueltig" | tee -a $logfile
	cat /var/log/letsencrypt/letsencrypt.log > $DEBUG
}

error() {
	echo ""
	echo "${ROT}"
	echo "Unerwarteter Fehler aufgetreten, Programm wird beendet"
	echo "${T}"
	echo ""
	exit 1;
}

# VARIABLEN
d=`date +%d.%m.%y`
ROT=`tput setaf 1`
T=`tput setaf 9`
logfile=/var/log/cronjobs/certbot_$d.log
DEBUG=/var/log/cronjobs/certbot_$d_debug.log

echo "Last Run: $d" | tee -a $logfile

sudo certbot renew --dry-run

CERTBOT_EXITCODE=$?
if [ $CERTBOT_EXITCODE -eq 0 ]; then

	certbot_start

elif [ $CERTBOT_EXITCODE1 -eq 1 ]; then
	
	echo
	echo "${ROT}"
	echo Fehler bei Certbot Ausführung | tee -a $logfile
	echo "${T}"
else
	error
fi
echo
echo

# Falls was schief laufen sollte, die Zertifikate sollten sich im Ordner
#
# /etc/letsencrypt/live/paqo.de/
#
# befinden.
