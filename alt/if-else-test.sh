#!/bin/sh
read -p "Ja oder nein? " x

if [ $x = "ja" ]; then
	echo "Positiv"

	else
	echo "Negativ"
fi
