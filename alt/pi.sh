#!/bin/bash
clear
path=/home/sandro/Downloads
echo "Schreibe Image auf SD-Karte"
echo "---------------------------"
echo ""
dd bs=4M if=$path/2016-02-26-raspbian-jessie.img of=/dev/sdf
echo ""
echo ""
echo "Schreibe SD-Karte in Image"
echo "--------------------------"
echo ""
dd bs=4M if=/dev/sdf of=$path/from-sd-card.img
echo ""
echo ""
echo "Bringe die Karte auf die Größe des Images"
echo "-----------------------------------------"
echo ""
sudo truncate --reference $path/2016-02-09-raspbian-jessie.img $path/from-sd-card.img
echo ""
echo ""
echo "Überprüfe, ob beide Images gleich sind"
echo "--------------------------------------"
echo ""
diff -s $path/2016-02-26-raspbian-jessie.img $path/from-sd-card.img
