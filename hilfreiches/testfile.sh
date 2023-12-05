#!/bin/bash
T=`tput setaf 2`
ROT=`tput setaf 1`
BLAU=`tput setaf 6`

if [ $# == 1 ];then
	testfile="$1"
	if [ -f "$testfile" ];then
		echo
		echo "${testfile##*/} ${BLAU}ist vorhanden${T}."
		echo
	else
		echo
		echo "${testfile##*/} ${ROT}ist nicht vorhanden${T}."
		echo
	fi
else
	echo
	echo "${ROT}Error${T}"
	echo
	echo "Benutzung:"
	echo "testfile.sh Pfad/Dateiname"
	echo
fi
