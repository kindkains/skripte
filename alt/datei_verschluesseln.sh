#!/bin/bash
echo "Um einen neuen Schlüssel zu importieren, bitte seahorse starten"
gpg --list-keys
echo "Mit welchem Schlüssel soll verschlüsselt werden?" 
read answer 

gpg --encrypt -a --recipient $answer /home/sandro/Dokumente/GnuPG/Evolution/adresse 
mv /home/sandro/Dokumente/GnuPG/Evolution/adresse.asc /home/sandro/Dokumente/GnuPG/Evolution/adresse_für_$answer.asc
