#!/bin/bash
clear
gpg --list-keys
echo ""
echo "Mit welcher Schlüssel-ID soll verschlüsselt werden?"
read id
echo ""
echo "Alles klar, ich verschlüssele die Nachricht mit dem Schlüssel $id"
echo "Bitte Text nachfolgend eingeben und zum Beenden STRG+D drücken."
echo "-----------------------------------------------------------------"
echo ""
echo ""
gpg -e -a -r $id
echo ""
