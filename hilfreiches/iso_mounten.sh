#!/bin/bash
read -p "Als erstes bitte den Pfad angeben, in welchem das ISO liegt: " pfad
read -p "Danke. Und nun bitte den Namen des ISO Files eingeben: " file
mount $pfad/$file /mnt/ISO -t iso9660 -o loop 
echo "$pfad/$file wurde erfolgreich nach /mnt/ISO eingehangen!"
cd /mnt/ISO
ls -lah
