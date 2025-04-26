#!/bin/bash
clear
# pidof: 0 = läuft, 1 = läuft nicht

echo "Bitte Namen des Prozesses eingeben, der überprüft werden soll: "
read prozess
x=`pidof $prozess`;
echo ""

if [ "$x" == "" ];
	then
		echo "$prozess läuft nicht"
	else
		echo "$prozess läuft (Prozess-ID: $x"
echo ""
fi

exit 0
