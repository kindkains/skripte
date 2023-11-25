#! /bin/bash

clear

FILE=test
x=1

while read CMD; do
	echo "In Zeile $x steht: $CMD"
	x=$((x+1))
done < "$FILE"
