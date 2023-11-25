#!/bin/bash
clear

# Verzeichnis festlegen, wo die Adressen abgelegt werden sollen
# -------------------------------------------------------------

pfad="/home/sandro/Dokumente/GnuPG/Adresse"

# Gewünschte Adresse für den Drop abfragen
# ----------------------------------------

echo "Um einen neuen Schlüssel zu importieren, bitte zuvor seahorse starten"
echo "Bitte die Adresse des Drop eingeben:"
echo "------------------------------------"
echo ""
echo "Vor- und Nachname"
read name
echo $name > $pfad/temp
echo ""
echo "Straße und Hausnummer"
read strasse
echo $strasse >> $pfad/temp
echo ""
echo "PLZ und Ort"
read ort
echo $ort >> $pfad/temp
echo ""
echo "Germany" >> $pfad/temp
echo "" >> $pfad/temp
echo ""

# Schlüssel für Verschlüsselung abfragen
# --------------------------------------

gpg --list-keys
echo "Mit welchem Schlüssel soll verschlüsselt werden?" 
read key

# Gewünschte Drop-Adresse aus vorhandenen Informationen zusammenstellen
# ---------------------------------------------------------------------

cat $pfad/präfix > $pfad/adresse
echo "" >> $pfad/adresse
cat $pfad/temp >> $pfad/adresse
cat $pfad/suffix >> $pfad/adresse
rm $pfad/temp

# Erstellte Adresse mit oben gewählten PGP-Key verschlüsseln und ausgeben
# -----------------------------------------------------------------------

gpg --encrypt -a --recipient $key $pfad/adresse 
mv $pfad/adresse.asc $pfad/adresse_für_$key.asc
cat $pfad/adresse_für_$key.asc
