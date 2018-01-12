#!/bin/bash
clear

# Skript-Beschreibung

echo "Dieses Skript filtert sämtliche URLs aus einer Datei heraus und übergibt"
echo "das Ergebnis dann an wget. Geschrieben wurde es, um aus einer größeren html Datei alle Bilder Sourcen"
echo "heraus zu filtern und zu speichern."
echo ""
echo "Initiator war eine Bildergalerie auf gmx.de, wollte man ein Bild herunterladen, so erhielt man mit wget"
echo "lediglich eine html Datei, in dieser konnten aber alle Bilder-Sourcen gefunden werden."
echo ""
echo ""

# Variablen definieren

ziel=~/Bilder			# falls nicht anders vereinbart
url=~/url.list			# Zwischendatei
format=jpg

ROT=`tput setaf 1`
GELB=`tput setaf 3`
BLAU=`tput setaf 4`
CYAN=`tput setaf 6`
WEISS=`tput setaf 7`
UNSET=`tput setaf 9` 

# Funktionen definieren

error() {
echo ""
echo "${ROT}"
echo "Fehlerhafte Eingabe, Programm wird beendet"
echo "${UNSET}"
echo ""
exit;
}


# Start Skript
echo "Bitte den Pfad angeben, wo die zu durchsuchende Datei liegt:"
read src
echo ""
echo "${WEISS}Source Variable src wurde auf ${ROT}$src ${WEISS}gesetzt ${UNSET}"
echo ""

echo "Das Bilderformat ist standardmäßig auf ${ROT}${format}${UNSET} gesetzt."
read -p "Soll dieses Format beibehalten werden? ${BLAU}(j/n)${UNSET}: " x
echo ""

if [ "$x" = n ] || [ "$x" = N ] || [ "$x" = Nein ] || [ "$x" = nein ] || [ "$x" = NEIN ]; then
	read -p "Bitte neues Format bestimmen (ohne Punkt), z. B. png: " format
	echo ""
	echo "Gut, das Format wurde nun auf ${ROT}${format}${UNSET} gesetzt."

elif [ "$x" = j ] || [ "$x" = J ] || [ "$x" = Ja ] || [ "$x" = ja ] || [ "$x" = JA ]; then

	echo "Gut, das Format ${ROT}${format}${UNSET} wird beibehalten."

else
	error
fi

echo ""
echo "URLs werden eingelesen"
grep -Eo "(http|https)://[^\"]+${format}" $src > $url
echo "Befehl: ${CYAN}grep -Eo '(http|https)://[^\"]+${format}' "$src" > "$url" ${UNSET}wurde ausgeführt"
echo "Alle Bilder URLs sollten sich nun in der Datei ${ROT}${url} ${UNSET}befinden"
echo ""

echo "Der Standard Zielpfad befindet sich in $ziel"
read -p "Soll dieser Pfad beibehalten werden? ${BLAU}(j/n)${UNSET}: " x
echo ""

if [ "$x" = j ] || [ "$x" = J ] || [ "$x" = Ja ] || [ "$x" = ja ] || [ "$x" = JA ]; then
	echo "URLs werden nun an wget übergeben und die Inhalte nach $ziel heruntergeladen"
	sleep 2
	cd $ziel
	echo "${GELB}"
	cat "$url" | while read file; do wget "$file"; done;
	echo ""
	echo "${UNSET}"
	echo "Fertig"
	echo ""
	echo ""
	
elif [ "$x" = n ] || [ "$x" = N ] || [ "$x" = Nein ] || [ "$x" = nein ] || [ "$x" = NEIN ]; then
	echo "Bitte neuen Zielpfad definieren:"
	read ziel
	echo ""
	echo "Danke. Neues Ziel ist $ziel"
	sleep 2
	echo ""
	echo "URLs werden nun an wget übergeben und die Inhalte nach $ziel heruntergeladen"
	cd "$ziel"
	echo "${GELB}"
	cat "$url" | while read file; do wget "$file"; done;
	echo ""
	echo "${UNSET}"
	echo "Fertig"
	echo ""
	echo ""
else
	error
fi
sleep 2

echo ""
echo "Skript wurde erfolgreich beendet. $url wird nun nicht mehr benötigt und gelöscht."
echo "${ROT}"
rm -vf $url
echo "${UNSET}"
echo ""
echo ""
