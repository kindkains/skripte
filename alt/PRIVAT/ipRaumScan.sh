#!/bin/bash

echo -e "IP-Adresse\tHostname" > /home/sandro/Skripte/ergebnis
echo -e "==========\t========" >> /home/sandro/Skripte/ergebnis
echo -e "" >> /home/sandro/Skripte/ergebnis

x=1
y=$x
ip="192.168.0."
#ip="172.24.30."

while [ $x -lt 255 ];do
	if [ $(nslookup $ip$x | grep "name" &>/dev/null; echo $?) = 0 ];then
		host=$(nslookup $ip$x | grep "name" | awk -F "name = " '{print $2}')
		echo -e "$ip$x\t$host" >> /home/sandro/Skripte/ergebnis
		((x=$x+1))
	else
		((x=$x+1))
	fi
done 

clear
echo "Folgende Hosts wurden im IP-Raum von 192.168.0.$y bis 192.168.0.$x gefunden:"
echo -e "\n"
cat /home/sandro/Skripte/ergebnis
