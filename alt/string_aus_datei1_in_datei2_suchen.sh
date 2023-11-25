#!bin/bash
clear

# Folgendes Szenario:
# datei1 und datei2 enthalten sehr viele Strings
# Es soll überprüft werden, ob bestimmte Strings in BEIDEN Dateien vorkommen
# Ursprünglich war dies notwendig, um tausende, generierte BTC Adressen
# zu prüfen.

cat datei1 | while read i; do grep $i datei2; done
