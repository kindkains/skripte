#!/bin/bash
# pidof: 0 = läuft, 1 = läuft nicht

d=`date +%d.%m.%y`
t=`date +%H:%M`
x=`$1`;

echo ""

if [ "$x" == "" ];
	then
		echo "Prozess $x läuft nicht."
	else
		echo "Prozess $x läuft"
		exit
echo ""
fi

exit 0
