#!/bin/bash
clear
echo "Füge Google Chrome zur Sources List hinzu"
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
echo

echo "Füge Multisystem zur Sources List hinzu"
sudo sh -c 'echo "deb http://liveusb.info/multisystem/depot all main" >> /etc/apt/sources.list.d/multisystem.list'
wget -q http://liveusb.info/multisystem/depot/multisystem.asc -O- | sudo apt-key add - 
echo

sudo apt-get update 

echo "Paketliste wird nun installiert" 
cat paketliste | xargs sudo apt-get install -y
echo
