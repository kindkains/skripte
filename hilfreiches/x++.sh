#!/bin/bash

x=1

for i in {1..10};do
	echo "x ist gleich $x"
	echo "inkrementiere x: $x +1"
	echo
	x=$[x+1]			# Dies entspricht der Schreibweise x++
done					# Man könnte auch x=$[$x+1] schreiben
