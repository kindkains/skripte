#!/bin/bash
clear

# Farbvariablen für Skripte

BLACK=`tput setaf 0`
ROT=`tput setaf 1`
GRUEN=`tput setaf 2`
GELB=`tput setaf 3`
BLAU=`tput setaf 4`
LILA=`tput setaf 5`
CYAN=`tput setaf 6`
WEISS=`tput setaf 7`
T=`tput setaf 9`

echo "Es gibt zwei Möglichkeiten, um Farben in Skripten auf der Bash auszugeben"
echo "Variante 1:"
echo
echo "BLACK=\`tput setaf 0\`"
echo "$BLACK Schwarzer Text$T"
echo "ROT=\`tput setaf 1\`"
echo "$ROT Roter Text$T"
echo "GRUEN=\`tput setaf 2\`"
echo "$GRUEN Dunkelgrüner Text$T"
echo "GELB=\`tput setaf 3\`"
echo "$GELB Gelber Text$T"
echo "BLAU=\`tput setaf 4\`"
echo "$BLAU Blauer Text$T"
echo "LILA=\`tput setaf 5\`"
echo "$LILA Lila Text$T"
echo "CYAN=\`tput setaf 6\`"
echo "$CYAN Hellblauer Text$T"
echo "WEISS=\`tput setaf 7\`"
echo "$WEISS Weißer Text$T"
echo "T=\`tput setaf 9\`"
echo "$T Hellgrüner Text$T"
