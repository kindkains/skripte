#!/bin/bash

# Variablen definieren

ROT=`tput setaf 1`
GELB=`tput setaf 3`
BLAU=`tput setaf 4`
CYAN=`tput setaf 6`
WEISS=`tput setaf 7`
T=`tput setaf 9` 

# Funktionen definieren

error() {
echo ""
echo "${ROT}"
echo "Fehlerhafte Eingabe, Programm wird beendet"
echo "${T}"
echo ""
exit;
}

passwort() {

echo ""
echo "Neues Passwort für Benutzer festlegen"
echo "-------------------------------------"
echo ""
echo ""
read -p "Bitte den Benutzernamen angeben: " user
read -p "Bitte das neue Passwort angeben: " pw
echo ""
echo ""
read -p "Soll für den Benutzer ${WEISS}${user}${T} das Passwort auf ${WEISS}${pw}${T} geändert werden? ${BLAU}<j/n>${T} :" x

if [ "$x" = j ] || [ "$x" = J ] || [ "$x" = Ja ] || [ "$x" = ja ] || [ "$x" = JA ]; then

	echo "$user":"$pw" | sudo chpasswd
	if [ $? = 0 ]; then
		echo "Das Passwort von $user wurde auf $pw geändert"
		echo ""
		exit
	elif [ $? = 1 ]; then
		echo ""
		echo "${ROT}Zugang verweigert"
		echo "Sie haben nicht die nötigen Rechte, um diese Operation durchzuführen!"
		echo "Sie müssen root sein oder zur Gruppe sudo gehören${T}"
		echo ""
		echo "Sie sind derzeit Mitglied in den Gruppen:"
		id
		echo ""
		echo "Bitte kontaktieren Sie ihren Systemadministrator"
		echo "Programm wird beendet"
		echo ""
		exit
	elif [ $? = 2 ]; then
		echo ""
		echo "${ROT}Unerlaubte Kombination von Optionen${T}"
		echo ""
		echo "Bitte kontaktieren Sie ihren Systemadministrator ${WEISS}(Fehlercode 2)${T}"
		echo "Programm wird beendet"
		echo ""
		exit
	elif [ $? = 3 ]; then
		echo ""
		echo "${ROT}Ein unerwarteter Fehler ist aufgetreten"
		echo "Keine Änderung durchgeführt${T}"
		echo ""
		echo "Bitte kontaktieren Sie ihren Systemadministrator ${WEISS}(Fehlercode 3)${T}"
		echo "Programm wird beendet"
		echo ""
		exit
	elif [ $? = 4 ]; then
		echo ""
		echo "${ROT}Ein unerwarteter Fehler ist aufgetreten"
		echo "Die Datei passwd fehlt${T}"
		echo ""
		echo "Bitte kontaktieren Sie ihren Systemadministrator ${WEISS}(Fehlercode 4)${T}"
		echo "Programm wird beendet"
		echo ""
		exit
	elif [ $? = 5 ]; then
		echo ""
		echo "${ROT}passwd Datei ist beschäftigt"
		echo "Ein anderer Prozess scheint gerade darauf zuzugreifen${T}"
		echo ""
		echo "Bitte erneut versuchen oder kontaktieren Sie ihren Systemadministrator ${WEISS}(Fehlercode 5)${T}"
		echo "Programm wird beendet"
		echo ""
		exit
	elif [ $? = 6 ]; then
		echo ""
		echo "${ROT}Fehlerhaftes Argument als Option übergeben${T}"
		echo ""
		echo "Bitte kontaktieren Sie ihren Systemadministrator ${WEISS}(Fehlercode 6)${T}"
		echo "Programm wird beendet"
		echo ""
		exit
	else
		error
	fi
	
elif [ "$x" = n ] || [ "$x" = N ] || [ "$x" = Nein ] || [ "$x" = nein ] || [ "$x" = NEIN ]; then

	read -p "Soll das Programm beendet werden? ${BLAU}<j/n>${T} :" y
	
	if [ "$y" = j ] || [ "$y" = J ] || [ "$y" = Ja ] || [ "$y" = ja ] || [ "$y" = JA ]; then

		echo ""
		echo "Auf wiedersehen"
		echo ""
		exit

	elif [ "$y" = n ] || [ "$y" = N ] || [ "$y" = Nein ] || [ "$y" = nein ] || [ "$y" = NEIN ]; then

		passwort
		
	else
		error
	fi	

else
	error
fi
}

# Start Skript

clear
echo "Dieses kleine Skript erleichtert die Passwortänderung für Benutzer, welche sich nicht"
echo "Mit Linux Befehlen und dem Linux Terminal auskennen."
echo ""
echo ""

passwort
exit
