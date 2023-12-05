#!/bin/bash
clear

for_a-z() {
	# Gebe alle Buchstaben von A bis Z aus
	clear
	echo "Gebe alle Buchstaben von A bis Z aus"
	echo "------------------------------------"
	echo	
	echo "Befehl: for i in {A..Z}; do echo $i; done"
	echo 
	echo
	for i in {A..Z}; do echo $i; done
	echo
	sleep 3
}

for_one2ten() {
	# Führe 10 mal den Befehl echo "Hallo Welt!" aus
	clear
	echo "Führe 10 mal den Befehl echo 'Hallo Welt!' aus"
	echo "----------------------------------------------"
	echo
	echo "Befehl: for i in {1..10}; do echo "Hallo Welt!"; done"
	echo
	echo
	for i in {1..10}; do echo "Hallo Welt!"; done
	echo
}

for_one2x() {
	# Führe x-mal den Befehl echo "Hallo Welt!" aus
	clear
	echo "Führe X-mal den Befehl echo 'Hallo Welt!' aus"
	echo "---------------------------------------------"
	echo
	echo "Befehl: for i in \$(eval echo "{\$START..\$ENDE}"); do echo "Hallo Welt!"; done"
	echo
	echo
	START=1
	ENDE=15
	
	for i in $(eval echo "{$START..$ENDE}"); do echo "Hallo Welt!"; done
	echo
}

countdown() {
	# Führe einen Countdown aus
	clear
	echo "Führe einen Countdown aus"
	echo "-------------------------"
	echo
	read -p "Wie weit soll ich zählen? " END
	echo

	START=1

	echo "-----------"
	echo "-Countdown-"
	echo "-----------"
 
	for (( c=$START; c<=$END; c++ ))
		do
			echo -n "$c "
			sleep 1
		done
 	echo
	echo "-----------"
	echo "-  Boom!  -"
	echo "-----------"
	echo 
}


#!/bin/bash
clear

check=1

while [ $check = 1 ]; do
	if [ -n "$error" ]; then
		echo -e "\033[31m$error\033[0m"
	fi

	echo
	echo "Bitte Programm wählen:"
	echo "----------------------"
	echo
	echo "============="
	echo "For-Schleifen"
	echo "============="
	echo
	echo "1) Countdown"
	echo "2) Buchstaben von A bis Z ausgeben"
	echo "3) Führe 10 mal den Befehl echo 'Hallo Welt!' aus"
	echo "4) Führe X mal den Befehl echo 'Hallo Welt!' aus"
	echo "5) Ende"
	echo 
	echo "==============="
        echo "While-Schleifen"
        echo "==============="
        echo
	echo "coming soon"
	echo
	read -p "Ihre Auswahl: " cmd
	cmd=${cmd,,}

	case $cmd in

		1)
			countdown
			sleep 3
			check=0
			;;
		2)
			for_a-z
			sleep 3
			check=0
			;;
		3)
			for_one2ten
			sleep 3
			check=0
			;;
		4)
			for_one2x
			sleep 3
			check=0
			;;
		5)
			echo
			echo "Programm wird beendet"
			echo
			exit 0;
			;;
		q)
			echo
			echo "Programm wird beendet"
			echo
			exit 0;
			;;
		end)
			echo
			echo "Programm wird beendet"
			echo
			exit 0;
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
			error='Fehlerhafte Eingabe - Bitte eine Zahl von 1 bis 5 wählen'
			check=1
		esac
	done


echo Ende des Programms
echo
exit 0;
