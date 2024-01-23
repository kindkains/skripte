#!/bin/bash

output=ergebnis

echo -e "IP-Adresse\tHostname" > $output
echo -e "==========\t========" >> $output
echo -e "" >> $output

x=1
clear
echo "Welcher Netzbereich soll gescant werden?"
read -p "Bsp. für 192.168.0.0/24 eine 0 eingeben, eine 1 für 192.168.1.0/24):  " y
ip="192.168.$y.$x"

while [ $x -lt 256 ];do
	if [ $(nslookup $ip | grep "name" &>/dev/null; echo $?) = 0 ];then
		host=$(nslookup $ip | grep "name" | awk -F "name = " '{print $2}')
		echo -e "{$ip}\t${host}" >> $output
		echo "Scanne $ip | Treffer!"
		((x=$x+1))
		ip="192.168.$y.$x"
	else
		echo "Scanne $ip | Keine Antwort!"
		((x=$x+1))
		ip="192.168.$y.$x"
	fi
done 

clear
echo "Folgende Hosts wurden im IP-Raum von 192.168.${y}.1 bis ${ip} gefunden:"
echo -e "\n"
cat $output
