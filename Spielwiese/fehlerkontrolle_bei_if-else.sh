#!/bin/sh
clear

echo "Dies ist ein Beispielskript für if-else Anweisungen"
echo "---------------------------------------------------"
echo ""
echo ""

# Farbvariablen für Skripte

ROT=`tput setaf 1`
GELB=`tput setaf 3`
CYAN=`tput setaf 6`
WEISS=`tput setaf 7`
UNSET=`tput setaf 9`

# Variablen

p=Positiv
n=Negativ

# Funktionen definieren

error() {
	echo ""
	echo "${ROT}"
	echo "Fehlerhafte Eingabe, Programm wird beendet"
	echo "${UNSET}"
	echo ""
	exit;
}

# Skript Anfang

echo "Alle 'Ja'-Optionen sollten ${CYAN}${p}${UNSET} als Ergebnis ausgeben und"
echo "Alle 'Nein'-Optionen sollten ${ROT}${n}${UNSET} als Ergebnis ausgeben."
echo "Alle anderen, nicht erlaubten Eingaben, sollten eine Fehlermeldung ausgeben."
echo ""
echo ""

read -p "Ja oder nein? ${GELB}(JA/Ja/ja/j|NEIN/Nein/nein/n):${UNSET} " x
echo ""

# Hier wird klassisch im Block eine If-ifelse-else Abfrage durchgeführt, wobei ifelse in Bashskript als elif geschrieben wird

if [ "$x" = "ja" ] ; then

	echo "${CYAN}${p}${UNSET}\n"

elif [ "$x" = "Ja" ]; then

	echo "${CYAN}${p}${UNSET}\n"

elif [ "$x" = "j" ]; then

	echo "${CYAN}${p}${UNSET}\n"

elif [ "$x" = "J" ]; then

	echo "${CYAN}${p}${UNSET}\n"

elif [ "$x" = "JA" ]; then

	echo "${CYAN}${p}${UNSET}\n"

# Hier erhält man das gleiche Ergebnis wie oben, jedoch kann durch die ODER-Verknüpfung ( || ) der Befehl in eine
# einzelne Zeile gesetzt werden

elif [ "$x" = "nein" ] || [ "$x" = "Nein" ] || [ "$x" = "n" ]  || [ "$x" = "N" ] || [ "$x" = "NEIN" ]; then

	echo "${ROT}${n}${UNSET}\n"

# Wenn x weder ja (positiv) noch nein (negativ) ist, so soll else ausgeführt werden.
# In diesem Fall eine Fehlermeldung, da ein anderer Wert als der zu erwartende eingegeben wurde.

else
	error
fi
