#!/bin/bash
clear

# Funktionen

error() {
	echo ""
	echo "${ROT}"
	echo "Fehlerhafte Eingabe, Programm wird beendet"
	echo "${T}"
	echo ""
	exit 1;
}


# Variablen

ROT=`tput setaf 1`
T=`tput setaf 9`
RSYNC_OPTS="-avr -e ssh -P --progress --delete"
LOG=/var/log/rsync_$(date '+%Y-%m').log

read -p "Source Pfad: " SRC
read -p "Ziel Pfad: " TAR

echo
echo Start der Sicherung am $(date) | tee -a $LOG
echo
echo Starte sichern von Daten:
echo -------------------------
echo
sudo rsync $RSYNC_OPTS $SRC $TAR
RSYNC_EXITCODE1=$?
if [ $RSYNC_EXITCODE1 -eq 0 ]; then
	
	echo Sicherung der Daten war erfolgreich | tee -a $LOG

elif [ $RSYNC_EXITCODE1 -eq 23 ]; then
	
	echo Sicherung der Daten fehlgeschlagen | tee -a $LOG
else
	error
fi
echo
echo
