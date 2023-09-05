#!/bin/bash

# Mit diesem Skript werden ALLE Firewall Regeln gelöscht und JEDER Verkehr zugelassen
# Nur verwenden, wenn man iptables von Grund auf neu konfigurieren möchte.
# Die bestehende SSH-Verbindung wird beibehalten.

x=0

clear
echo "Datenverkehr wird in alle Richtungen geöffnet"
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sleep $x
echo "Fertig"
echo
echo "Alle anderen Regeln werden verworfen"
sudo iptables -t nat -F
sudo iptables -t mangle -F
sudo iptables -F
sudo iptables -X
sleep $x
echo "Fertig"
echo
echo
echo "Ausgabe der aktuell bestehenden Regeln mittels iptables -S"
sleep $x
echo
sudo iptables -S
