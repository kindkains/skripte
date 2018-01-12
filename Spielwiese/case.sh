#!/bin/bash
clear

check=1

while [ $check = 1 ]; do
	if [ -n "$error" ]; then
		echo -e "\033[31m$error\033[0m"
	fi

	echo
	read -p "Auswahl [1|2|3]: " cmd
	cmd=${cmd,,}

	case $cmd in

		1)
			echo Auswahl war 1
			echo
			check=0
			;;
		2)
			echo Auswahl war 2
			echo
			check=0
			;;
		3)
			echo Auswahl war 3
			echo
			check=0
			;;
		quit)
			echo
			echo "Programm wird beendet"
			echo
			exit 0;
			;;
		exit)
			echo
			echo "Programm wird beendet"
			echo
			exit 0;
			;;
		*)
			echo
			error='Fehlerhafte Eingabe - Bitte 1, 2 oder 3 wählen'
			check=1
		esac
	done


echo Ende des Programms
exit 0;
