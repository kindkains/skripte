#!/bin/bash
clear

echo "****************************************************************************************************"
echo "*Dieses Skript soll alle Dateien im DCIM Ordner eines Smartphones via rsync auf dem Rechner sichern*"
echo "****************************************************************************************************"
echo ""
echo ""
echo ""
echo "Bitte IP des Smartphones eingeben. Normalerweise 192.168.0.8 für Sandro und 192.168.0.9 für Ania: "
read ip
echo ""
echo "Danke, die IP $ip wird nun verwendet"
echo ""
echo ""
echo "Bitte den Quellpfad auf dem Smartphone eingeben. Standard wäre /data/data/com.arachnoid.sshelper/home/SDCard/DCIM : "
read quelle
echo ""
echo "Danke, der Quellpfad $quelle wird nun verwendet"
echo ""
echo ""
echo "Nun bitte noch den Zielpfad eingeben: "
read ziel
echo ""
echo "Danke, der Zielpfad $ziel wird nun verwendet"
echo ""
echo ""
echo "Ich beginne nun mit der Synchronisation von $quelle nach $ziel von der IP $ip"
echo ""

rsync -avzP -e "ssh -p 2222" sandro@$ip:$quelle $ziel

echo ""
echo ""
echo ""
echo "Synchronisation abgeschlossen"
