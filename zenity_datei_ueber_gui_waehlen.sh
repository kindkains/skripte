#!/bin/bash
clear

# Variablen

PFAD="$(zenity --file-selection)"
DATEI="$PFAD"
PROG=vlc

echo "Das Script '$0' wird ausgeführt"
echo


echo -e "Die Datei \033[31m '$DATEI' \033[0m wird an \033[31m $PROG \033[0m übergeben"
echo
$PROG "$DATEI"
