#!bin/bash
clear

FILE=test

while read CMD; do
	echo "$CMD"
done < "$FILE"
