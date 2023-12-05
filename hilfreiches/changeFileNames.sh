#!/bin/bash
# Variable string mit dem Teil des Dateinamens befüllen, welcher gelöscht werden soll

string=GERMAN.AC3.720p.BluRay.x264-w00t.

typeset -a dateien
dateien=(`find -maxdepth 1 -type f -exec basename {} \;`)

for i in ${dateien[@]}; do
	echo $i | sed "s/${string}//g" | while read n; do mv $i $n; done
done
