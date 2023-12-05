#!/bin/bash
clear

FILE=while_schleife.txt

while read CMD; do
	echo "$CMD"
done < "$FILE"
