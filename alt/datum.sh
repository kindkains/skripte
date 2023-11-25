#!/bin/bash

echo ""
echo "Ausgabe Datum mit Uhrzeit"
# Format: 2012-08-16-23-00
d=`date +%Y-%m-%d-%H-%M`
echo $d
echo ""
 

echo "Ausgabe Datum ohne Uhrzeit"
# Format: 2012-08-16
 
d=`date +%Y-%m-%d`
echo $d
echo ""
echo "Beispiel Anwendung"
d=`date +%Y%m%d`
echo programm-$d.log
echo ""

echo ""
echo "Ausgabe mit Datum und Uhrzeit, menschlich lesbar"
# Format: 16.08.2012_15:33 Uhr
u=" Uhr"
d=`date +%d.%m.%Y_%H:%M`$u
echo $d
echo ""

echo ""
echo "Ausgabe mit Datum und Uhrzeit, menschlich lesbar und geschickter gelöst"
# Format: 16.08.2012 15:33 Uhr
d=`date +%d.%m.%Y`
t=`date +%H:%M`
echo $d $t "Uhr"
echo ""
