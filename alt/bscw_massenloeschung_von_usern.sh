#!/bin/sh
clear
echo "Massenlöschung von BSCW Benutzern"
echo "================================="
echo ""
echo "Mit Hilfe von diesem Skript werden alle Benutzer gelöscht, welche sich in der Datei"
echo "/root/skripte/userliste.txt befinden."
echo "Bitte diese Datei zunächst mit den gewünschten Usern befüllen!"
echo ""
echo ""
read -p "Folgende Benutzer werden zum Löschen vorgemerkt:" leer
echo ""
less /root/skripte/userliste.txt

read -p "Soll ich die vorgemerkten Benutzer löschen? (ja/nein) " y
	if [ $y = "ja" ];
		then
			
echo ""
echo "Beginne mit dem Löschen der gewünschten Benutzer"
echo "================================================"
echo ""

for i in `cat /root/skripte/userliste.txt`
	do
		echo "Lösche Benutzer $i"
		/srv/bscw/srv/bscw.bildung-rp.de/bin/bsadmin rmuser $i
		echo "Benutzer $i wurde gelöscht."
	done

		else
			echo "Breche Skript ab."
fi
