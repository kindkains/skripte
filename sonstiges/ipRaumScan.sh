#!/bin/bash

echo -e "IP-Adresse\tHostname" > /home/sandro/skripte/ergebnis
echo -e "==========\t========" >> /home/sandro/skripte/ergebnis
echo -e "" >> /home/sandro/skripte/ergebnis

x=1
y=$x
ip="192.168.0."
#ip="172.24.30."
#ip="192.168.199."
#ip="192.168.201."

while [ $x -lt 256 ];do
	if [ $(nslookup $ip$x | grep "name" &>/dev/null; echo $?) = 0 ];then
		host=$(nslookup $ip$x | grep "name" | awk -F "name = " '{print $2}')
		echo -e "$ip$x\t$host" >> /home/sandro/skripte/ergebnis
		((x=$x+1))
	else
		((x=$x+1))
	fi
done 

clear
echo "Folgende Hosts wurden im IP-Raum von $ip$y bis $ip$x gefunden:"
echo -e "\n"
cat /home/sandro/skripte/ergebnis
