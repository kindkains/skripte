#!/bin/bash

output=ergebnis

echo -e "IP-Adresse\tHostname" > $output
echo -e "==========\t========" >> $output
echo -e "" >> $output

x=1
y=$x
ip1="172.24.30."
ip2="192.168.99."
ip3="192.168.201."

while [ $x -lt 256 ];do
	if [ $(nslookup $ip1$x | grep "name" &>/dev/null; echo $?) = 0 ];then
		host=$(nslookup $ip1$x | grep "name" | awk -F "name = " '{print $2}')
		echo -e "$ip1$x\t$host" >> $output
		((x=$x+1))
	else
		((x=$x+1))
	fi
done 

clear
echo "Folgende Hosts wurden im IP-Raum von 172.24.30.$y bis 172.24.30.$x gefunden:"
echo -e "\n"
echo "" >> $output
cat $output

x=1
y=$x

while [ $x -lt 256 ];do
	if [ $(nslookup $ip2$x | grep "name" &>/dev/null; echo $?) = 0 ];then
		host=$(nslookup $ip2$x | grep "name" | awk -F "name = " '{print $2}')
		echo -e "$ip2$x\t$host" >> $output
		((x=$x+1))
	else
		((x=$x+1))
	fi
done 

echo "Folgende Hosts wurden im IP-Raum von 192.168.199.$y bis 192.168.199.$x gefunden:"
echo -e "\n"
echo "" >> $output
cat $output

x=1
y=$x

while [ $x -lt 256 ];do
	if [ $(nslookup $ip3$x | grep "name" &>/dev/null; echo $?) = 0 ];then
		host=$(nslookup $ip3$x | grep "name" | awk -F "name = " '{print $2}')
		echo -e "$ip3$x\t$host" >> $output
		((x=$x+1))
	else
		((x=$x+1))
	fi
done 

clear
echo "Folgende Hosts wurden im IP-Raum von 192.168.201.$y bis 192.168.201.$x gefunden:"
echo -e "\n"
cat $output
