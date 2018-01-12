#!/bin/sh

echo "Wechsel ins Bitmessage Verzeichnis" 
cd ~/PyBitmessage/src/

echo "Bitmessage wird aktualisiert"
git fetch --all
git reset --hard origin/master

echo "" && echo "Aktualisierung abgeschlossen"
echo "Bitmessage wird gestartet"
python ~/PyBitmessage/src/bitmessagemain.py
