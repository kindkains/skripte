#!/bin/bash
clear


# Config ********************************************************************************​************
RSYNC_OPTS="-avr -e ssh -P --progress --delete"
FLOG=/var/piserver1/log$(date '+%Y-%m').txt


# LogFile ********************************************************************************​***********
# | tee -a $FLOG ist das gleiche als wenn nochmals echo mit >> $FLOG stehen wuerde
# also auf bildschirm und in die datei
echo Start der Sicherung am $(date) | tee -a $FLOG


# Daten ********************************************************************************​*************
echo Start sichern von DatenS
sudo rsync $RSYNC_OPTS /media/usb/tv_daten/004_DatenS /media/usb/sicherungen/
RSYNC_EXITCODE1=$?
if [ $RSYNC_EXITCODE1 -eq 0 ]; then
	    echo Sicherung von DatenS erfolgreich | tee -a $FLOG
	fi
	if [ $RSYNC_EXITCODE1 -eq 23 ]; then
		    echo Sicherung von DatenS fehlgeschlagen | tee -a $FLOG
		fi
		echo
		echo


		# Fotos ********************************************************************************​*************
		echo Start sichern von Fotos
		sudo rsync $RSYNC_OPTS /media/usb/tv_daten/002_Fotos /media/usb/sicherungen/
		RSYNC_EXITCODE2=$?
		if [ $RSYNC_EXITCODE2 -eq 0 ]; then
			    echo Sicherung von Fotos erfolgreich | tee -a $FLOG
			fi
			if [ $RSYNC_EXITCODE2 -eq 23 ]; then
				    echo Sicherung von Fotos fehlgeschlagen | tee -a $FLOG
				fi
