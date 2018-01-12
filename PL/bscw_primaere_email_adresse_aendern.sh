#!/bin/sh
clear
echo "Miniskript zum Ändern der primären Email Adressen und löschen der sekundären"
echo "============================================================================"
echo ""
echo "Was möchten Sie tun?"
echo "1) Eine neue primäre Email Adresse zuweisen"
echo "2) Eine sekundäre Email Adresse löschen"
echo ""
read -p "" auswahl

if [ $auswahl = "1" ];
	then
		read -p "Für welchen Benutzer soll die Email Adresse geändert werden? " user
		read -p "Wie soll die neue, primäre Email Adresse lauten? " email
		/srv/bscw/srv/bscw.bildung-rp.de/bin/bsadmin register -U $email $user
		echo ""
		echo "Für den Benutzer $user wurde nun die Adresse $email als primär gesetzt!"
		echo ""
		echo ""
	
	else
		read -p "Welche Email Adresse soll gelöscht werden? " del_email
		/srv/bscw/srv/bscw.bildung-rp.de/bin/bsadmin register -d $del_email
		echo ""
		echo "Die Email Adresse $del_email wurde aus dem System entfernt."
		echo ""
		echo ""
fi
