#!/bin/bash

# Erklärung:
# Manchmal kam es in der Vergangenheit vor, dass Ordner in der Konsole mit einer völlig
# schlecht lesbaren Hintergrundfarbe versehen waren. Die Lösung für dieses Problem
# ist dieses Skript.
# Verantwortlich für die Farben ist die Umgebungsvariable:
#
# LS_COLORS
#
# welche mit diesem Skript auf einen vernünftigen Wert eingestellt wird.

dircolors -p > ~/.dircolors
cat ~/.dircolors | grep -v STICKY_OTHER_WRITABLE > ~/tmp_dirc1
cat ~/tmp_dirc1 | grep -v OTHER_WRITABLE > ~/tmp_dirc2
echo "STICKY_OTHER_WRITABLE 01;34 # dir that is sticky and other-writable (+t,o+w)" >> ~/tmp_dirc2
echo "OTHER_WRITABLE 01;34 # dir that is other-writable (o+w) and not sticky" >> ~/tmp_dirc2
cat ~/tmp_dirc2 > ~/.dircolors
rm -f ~/tmp_dirc1 ~/tmp_dirc2
eval "$(dircolors -b ~/.dircolors)" 
