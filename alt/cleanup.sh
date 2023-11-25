#!/bin/bash
clear
echo "************************************************************"
echo "***************Starte Bereinigung des Systems***************"
echo "************************************************************"
echo ""
echo "Entferne herunter geladene Pakete mit apt-get clean"
sudo apt-get clean
echo ""
echo "Entferne verwaiste Pakete mit deborphan"
sudo deborphan | xargs sudo apt-get -y remove --purge
echo ""
echo "Fertig."
