#!/bin/bash
mkdir /var/log/squid3/logauswertung
clear
pfad="/var/log/squid3/logauswertung"
cd $pfad
echo "***********************************************************"
echo "*********************PL-Stasi-Skript***********************"
echo "***********************************************************"
echo ""
echo "Mit Hilfe dieses Skriptes lassen sich die Logdateien des Proxy-Servers"
echo "auswerten und nach verdächtigen bzw. unerwünschten Verbindungen"
echo "filtern."
echo ""
read -p "Welche IP Adresse soll ausgewertet und überwacht werden? " ip
read -p "Name des Mitarbeiters, dem die IP gehört (OHNE Leerzeichen): " name
echo "Kopiere alle Logdateien nach /var/log/squid3/logauswertung"
echo "----------------------------------------------------------"
echo ""
cp -v /var/log/squid3/access.log* $pfad/
zahl=`ls -la $pfad/access.log.* | wc -l`
echo ""
echo "Starte Entpackungsvorgang"
echo "-------------------------"
echo ""

for ((x=2; x<=$zahl; x++))
	do
		echo "Entpacke access.log.$x.gz"
		unp access.log.$x.gz
		echo "access.log.$x.gz wurde entpackt"
	done

echo ""
echo "Alle Archive fertig entpackt."
echo ""
echo "Lösche Archive!"
rm $pfad/*.gz
echo "Fertig."
echo ""
echo "Angegebene IP-Adresse $ip wird nun aus den access.log Dateien extrahiert."
echo "----------------------------------------------------------------------------------"
echo ""
cat $pfad/access.log | grep $ip >> $pfad/$name.log

for ((i=1; i<=$zahl; i++))
	do
		cat $pfad/access.log.$i | grep $ip >> $pfad/$name.log
	done

echo "In dieser Log-Datei sieht man einzelne Serienfolgen, welche auf dem Portal MyVideo geschaut wurden" >> $pfad/folgen.log
echo "==================================================================================================" >> $pfad/folgen.log
echo "" >> $pfad/folgen.log

cat $pfad/$name.log | grep myvideo >> $pfad/myvideo.log
cat $pfad/myvideo.log | grep staffel >> $pfad/folgen.log
cat $pfad/$name.log | grep youtube >> $pfad/youtube.log
cat $pfad/$name.log | grep facebook >> $pfad/facebook.log
cat $pfad/$name.log | grep youporn >> $pfad/youporn.log
cat $pfad/$name.log | grep redtube >> $pfad/redtube.log
cat $pfad/$name.log | grep porn >> $pfad/porno.log
rm $pfad/access.*

echo ""
echo "Auswertung erfolgreich beendet. Die gewünschten Logdateien wurden erstellt."
echo "Im Log $pfad/$name.log finden Sie alle Verbindungen von $name, welche über diesen Proxy Server gelaufen sind."
echo "Die angegebene IP war die $ip"
echo "Zusätzlich finden Sie noch einzelne Logdateien wie z. B. youtube.log, in der die Verbindungen nach diesem speziellen Aufruf gefiltert wurden."
echo ""
