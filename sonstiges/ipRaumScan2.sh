#!/bin/bash

echo -e "IP-Adresse\tHostname" > /home/sandro/skripte/ergebnis
echo -e "==========\t========" >> /home/sandro/skripte/ergebnis
echo -e "" >> /home/sandro/skripte/ergebnis

x=1
y=$x
ip1="172.24.30."
ip2="192.168.199."
ip3="192.168.201."

while [ $x -lt 256 ];do
	if [ $(nslookup $ip1$x | grep "name" &>/dev/null; echo $?) = 0 ];then
		host=$(nslookup $ip1$x | grep "name" | awk -F "name = " '{print $2}')
		echo -e "$ip1$x\t$host" >> /home/sandro/skripte/ergebnis
		((x=$x+1))
	else
		((x=$x+1))
	fi
done 

clear
echo "Folgende Hosts wurden im IP-Raum von 172.24.30.$y bis 172.24.30.$x gefunden:"
echo -e "\n"
echo "" >> /home/sandro/skripte/ergebnis
cat /home/sandro/skripte/ergebnis

x=1
y=$x

while [ $x -lt 256 ];do
	if [ $(nslookup $ip2$x | grep "name" &>/dev/null; echo $?) = 0 ];then
		host=$(nslookup $ip2$x | grep "name" | awk -F "name = " '{print $2}')
		echo -e "$ip2$x\t$host" >> /home/sandro/skripte/ergebnis
		((x=$x+1))
	else
		((x=$x+1))
	fi
done 

echo "Folgende Hosts wurden im IP-Raum von 192.168.199.$y bis 192.168.199.$x gefunden:"
echo -e "\n"
echo "" >> /home/sandro/skripte/ergebnis
cat /home/sandro/skripte/ergebnis

x=1
y=$x

while [ $x -lt 256 ];do
	if [ $(nslookup $ip3$x | grep "name" &>/dev/null; echo $?) = 0 ];then
		host=$(nslookup $ip3$x | grep "name" | awk -F "name = " '{print $2}')
		echo -e "$ip3$x\t$host" >> /home/sandro/skripte/ergebnis
		((x=$x+1))
	else
		((x=$x+1))
	fi
done 

clear
echo "Folgende Hosts wurden im IP-Raum von 192.168.201.$y bis 192.168.201.$x gefunden:"
echo -e "\n"
cat /home/sandro/skripte/ergebnis
