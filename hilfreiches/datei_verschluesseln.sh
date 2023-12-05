#!/bin/bash
clear
echo "Hilfskript zum Verschlüsseln und Entschlüsseln von Dateien"
echo "=========================================================="
echo ""
echo ""

datum=`date +%Y-%m-%d-%H-%M`

echo "Was möchten Sie tun?"
echo "1) Eine Datei verschlüsseln"
echo "2) Eine Datei entschlüsseln"

read -p "" auswahl
if [ $auswahl = "1" ];
	then
		read -p "Welche Datei soll verschlüsselt werden? Bitte vollständigen Pfad angeben: " eingabe
		read -p "Wo soll die verschlüsselte Datei abgelegt werden? Bitte vollständigen Pfad angeben: " ausgabe
		echo ""
		echo "Mit welchem Schlüssel soll verschlüsselt werden?" 
		gpg --list-keys
		echo "Mit welchem Schlüssel soll verschlüsselt werden?" 
		read pupkey 
		echo ""
		echo ""
		echo "Danke. Die Datei $eingabe wird mit dem Schlüssel $pupkey verschlüsselt und in $ausgabe abgelegt."

		gpg --output $ausgabe/$datum-verschluesselte-datei.gpg --encrypt --recipient $pupkey $eingabe
 
	else	
		read -p "Welche Datei soll entschlüsselt werden? Bitte vollständigen Pfad angeben: " eingabe
		read -p "Wo soll die entschlüsselte Datei abgelegt werden? Bitte vollständigen Pfad angeben: " ausgabe
		echo ""
		gpg --output $ausgabe/entschlüsselt-am-$datum --decrypt $eingabe
		echo ""
		echo "Die Datei $eingabe wurde erfolgreich nach $ausgabe/entschlüsselt-am-$datum entschlüsselt"
fi
