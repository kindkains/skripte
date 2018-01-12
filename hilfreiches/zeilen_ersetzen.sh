#!/bin/bash

# Variablen
d=`date +%d-%m-%Y`

clear
echo "Mit diesem Skript wird eine Datei Zeile für Zeile ausgelesen (es darf immer NUR ein Wort pro Zeile stehen)"
echo "und jedes Wort wird um einen Zusatz ergänzt, der in einer Variablen steht"
echo ""
echo "Bitte Pfad zur Datei angeben (z. B. /home/user/text.doc): "
read pfad

echo ""
echo "Gut, um welchen Zusatz sollen die Wörter ergänzt werden?"
read add


cat $pfad | while read line
	do 
	echo "Ich lese $line und ergänze es um $add"
	echo "${line}${add}" >> "${pfad}_neu"
	echo "Dies ergibt dann: ${line}${add}"
	echo ""
	done

echo ""
ls -lah $pfad*
