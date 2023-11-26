#!/bin/bash
clear

check=1

while [ $check = 1 ]; do
	if [ -n "$error" ]; then
		echo -e "\033[31m$error\033[0m"
	fi

	echo
	echo "1) Einen Key in den Schlüsselbund importieren"
	echo "2) Eine Adresse verschlüsseln"
	echo "3) Eine Nachricht verschlüsseln"
	echo "4) Eine Nachricht entschlüsseln"
	echo "5) Einen publicKey exportieren"
	echo "6) Einen privateKey exportieren"
	echo "7) Eine Datei verschlüsseln"
	echo "8) Eine Datei entschlüsseln"
	echo "9) Einen publicKey löschen"
	echo "10) Einen privatekey löschen"
	echo "11) Passwort ändern"
	echo "12) Einen Schlüssel editieren"
	cmd=${cmd,,}
	echo
	read -p "" cmd

	case $cmd in

		1)
			# Einen Key in den Schlüsselbund importieren
			echo "Datei muss sich im gleichen Verzeichnis befinden"
			read -p "Dateiname: " file
			gpg --import ${PWD}/${file}
			echo
			check=0
			;;
		2)
			# Eine Adresse verschlüsseln
			pfad="/home/$USER/Dokumente/GnuPG/Adresse"
			echo "Vor- und Nachname"
			read name
			echo $name > $pfad/temp
			echo 
			echo "Straße und Hausnummer"
			read strasse
			echo $strasse >> $pfad/temp
			echo 
			echo "PLZ und Ort"
			read ort
			echo $ort >> $pfad/temp
			echo 
			echo "Germany" >> $pfad/temp
			echo >> $pfad/temp
			echo 

			gpg --list-keys
			read -p "Mit welchem Schlüssel soll verschlüsselt werden? " key

			cat $pfad/präfix > $pfad/adresse
			echo "" >> $pfad/adresse
			cat $pfad/temp >> $pfad/adresse
			cat $pfad/suffix >> $pfad/adresse
			rm $pfad/temp

			gpg --encrypt -a --recipient $key $pfad/adresse
			mv $pfad/adresse.asc $pfad/adresse_für_$key.asc
			cat $pfad/adresse_für_$key.asc

			check=0
			;;
		3)
			# Eine Nachricht verschlüsseln
			gpg --list-keys
			read -p "Mit welchem Key die Nachricht verschlüsseln? " key
			gpg -e -a -r $key
			echo
			check=0
			;;

		4)
			# Eine Nachricht entschlüsseln
			echo "Bitte Text hierher kopieren."
			echo
			gpg -d &> ${PWD}/decrypted.txt
		        echo
		        cat ${PWD}/decrypted.txt
			check=0
			;;

		5)
			# Einen öffentlichen Schlüssel exportieren
			gpg --list-keys
			read -p "Welchen publicKey exportieren? " key
			gpg -a --output ${PWD}/${key}_pub.asc --export $key
			echo
			check=0
			;;

		6)
			# Einen privaten Schlüssel exportieren
			gpg --list-keys
			read -p "Welchen privateKey exportieren? " key
			gpg -a --output ${PWD}/${key}_sec.asc --export-secret-keys $key
			echo
			check=0
			;;

		7)
			# Eine Datei verschlüsseln
			gpg --list-keys
			read -p "Mit welchem Key verschlüsseln? " key
			echo "Datei muss sich im gleichen Verzeichnis befinden!"
			read -p "Dateiname: " file
			gpg --output ${PWD}/${file}.gpg --encrypt --recipient $key $file
			echo
			check=0
			;;

		8)
			# Eine Datei entschlüsseln
			echo "Datei muss sich im gleichen Verzeichnis befinden!"
			read -p "Dateiname: " file
			gpg --output ${PWD}/${file} --decrypt $file
			echo
			check=0
			;;

		9)
			# Einen Schlüssel löschen
			gpg --list-keys
			read -p "Welchen Schlüssel löschen? " key
			gpg --delete-key $key
			echo
			check=0
			;;

		10)
			# Einen Schlüssel löschen
			gpg --list-keys
			read -p "Welchen Schlüssel löschen? " key
			gpg --delete-secret-key $key
			echo
			check=0
			;;

		11)
			# Passwort eines Schlüssels editieren
			gpg --list-keys
			read -p "Welchen Key editieren? " key
			gpg --edit-key $key passwd
			echo
			check=0
			;;

		12)
			# Einen Schlüssel editieren
			gpg --list-keys
                        read -p "Welchen Key editieren? " key
                        gpg --edit-key $key
			echo
			check=0
			;;

		quit)
			echo
			echo "Programm wird beendet"
			echo
			exit 0;
			;;
		exit)
			echo
			echo "Programm wird beendet"
			echo
			exit 0;
			;;
		*)
			echo
			error='Fehlerhafte Eingabe - Bitte 1, 2 oder 3 wählen'
			check=1
		esac
	done


echo Ende des Programms
exit 0;
