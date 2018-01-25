#!/bin/bash
clear

prog=$(basename $0)
pid=$(echo $$)
lock='/var/run/skript.pid'
ssh='ssh -i /root/.ssh/id_rsa'

unlock() {

	if [ `wc -l < $lock` -gt 1 ]; then
		grep -v $$ $lock | tee $lock > /dev/null
		if [ `pgrep -fl $prog | wc -l` -eq 1 ]; then
			rm -v $lock
		else
			for i in `cat $lock`; do
				num=`ps afux | grep -v grep | grep $i`
				if [ -z "$num" ]; then
					grep -v $i $lock >> tmp.file
					mv tmp.file $lock
				fi
			done
		fi

	else
		rm -v $lock
	fi
}

if [ ! -f "$lock" ]; then
	echo $$ > $lock
else
	echo "Das Skript läuft bereits oder wurde nicht korrekt beendet"
	read -p "Trotzdem fortfahren? [j|n] " ant

	ant=${ant,,}

		if [[ "$ant" =~ (j|ja) ]]; then
			if [ `pgrep -fl $prog | wc -l` -eq 1 ]; then
				echo $$ > $lock
			else
				echo $$ >> $lock
			fi

		else
			echo
		        echo -e "\033[31mProzess wurde vom Benutzer beendet\033[0m"
		        echo
			exit 1
		fi
fi

var=$1
var=${var,,}

case $var in

	all)
		server="pi kodi radiopi"
		msg2="Alle Server"
	;;

	pi)	server="pi"
		msg2="Raspberry Pi NAS"
	;;

	kodi)
		server="kodi"
		msg2="Raspberry Pi Kodi"
	;;

	radio)
		server="radiopi"
		msg2="Raspberry Pi mpd Server"
	;;

	*)
		echo
		echo -e "\033[31m Fehlerhafte Eingabe \033[0m"
		echo
	;;

esac

check=1

# while [ $check=1 ]; do

	if [ -n "$error" ]; then
		echo -e "\033[31m$error\033[0m"
	fi

	echo
	read -p "Bitte Kommando spezifizieren [clean|uptime|update|upgrade|dist|reboot]: " CMD
	CMD=${CMD,,}

	case $CMD in
		clean)
			aptcmd="apt-get clean"
			msg="Paketliste wird gelöscht"
			check=0
			;;
		uptime)
			aptcmd="uptime"
			msg="Gib die Uptime aus"
			check=0
			;;
		update)
			aptcmd="apt-get update"
			msg="Paketindexdatei mit den Quellen synchronisieren"
			check=0
			;;
		upgrade)
			aptcmd="apt-get update; apt-get upgrade -y"
			msg="Upgrade durchführen"
			check=0
			;;
		dist)
			aptcmd="apt-get update; apt-get dist-upgrade -y"
			msg="Dist-Upgrade durchführen"
			check=0
			;;
		install)
			read -p "Paketnamen eingeben: " package
			aptcmd="apt-get install $package -y"
			msg="Das Paket|Die Pakete $package werden installiert"
			check=0
			;;
		reboot)
			aptcmd="reboot"
			msg="Server Reboot bei Kernel Updates"
			check=0
			;;
		exit)
			echo
			echo "Programm wird beendet"
			echo
			rm -f $lock
			exit 0;
			;;
		quit)
			echo
			echo "Programm wird beendet"
			echo
			rm -f $lock
			exit 0;
			;;
		*)
			echo
			echo -e "\033[31m Fehlerhafte Eingabe \033[0m"
			echo
			check=1
			;;
	esac
# done

echo
echo "Der paraelle Modus wird alle Befehle simultan auf den Servern ausgeben"
echo -e "\033[31mAchtung:\033[0m Es werden keinerlei Ausgaben oder Warnungen erzeugt."
read -p "Skript im paraellen Modus ausführen? [ja/nein] " para

para=${para,,}

echo
read -p "$msg wird auf $msg2 durchgeführt: Fortfahren? [ja/nein] " confirm
confirm=${confirm,,}

echo
if [ "$confirm" = "ja" ]; then

	for i in $server; do
		
		if [ "$para" = "ja" ]; then
			$ssh $i "$aptcmd > /dev/null" &
		else
			echo $i
			echo "====================================================================="
			echo "$ssh $i $aptcmd"
			$ssh $i "$aptcmd"
			echo
		fi
	done 
else
	echo
	echo -e "\033[31mProzess wurde vom Benutzer beendet\033[0m"
	echo
fi

echo $basename
echo $$
unlock
exit 0
