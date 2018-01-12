#!/bin/bash
clear

echo "Dieses Skript gilt als Beispiel für eine Fehlerausgabe bei einem Kopiervorgang."
echo "Wenn alle Kopiervorgänge erfolgreich durchgeführt wurden, dann ist die Variable errors=0"
echo "und es wird demnach eine Erfolgsmeldung ausgegeben."
echo "Treten jedoch Fehler auf, z. B. weil das Zielverzeichnis nicht existiert, so wird eine"
echo "Fehlermeldung ausgegeben."
echo ""

# Variablen
errors=0
fehler="ERROR: Es gab einen Fehler während des Kopiervorgangs!"
erfolg="Kopiervorgang war erfolgreich!"

# Farben
ROT=`tput setaf 1`
WEISS=`tput setaf 7`
UNSET=`tput setaf 9`

cp ~/tmp/*.jpg ~/tmp/foobar/ || { echo "" && echo "${ROT}${fehler}${UNSET}"; \
((errors++)); }

echo ""

if [ $errors -eq 0 ]
then
echo "${WEISS}${erfolg}${UNSET}"
echo ""
fi
