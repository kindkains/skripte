#!/bin/sh
clear

echo "Simple if-else Anweisung"
echo "Immer wenn die Eingabe nicht 'ja' ist, wird 'Negativ' ausgegeben"
echo ""
echo ""

read -p "Ja oder nein? " x
echo ""

if [ $x = "ja" ]; then
	echo "Positiv\n"

	else
	echo "Negativ\n"
fi
