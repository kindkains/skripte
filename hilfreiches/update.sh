#!/bin/bash
apt-get update
echo ""
echo "Paketliste aktualisiert"
echo "Beginne mit Upgrade"
echo ""
sleep 1
apt-get upgrade -y
#apt-get dist-upgrade -y
#update-flashplugin-nonfree --install
