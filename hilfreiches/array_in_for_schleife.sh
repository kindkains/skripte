#!/bin/bash

myArray=(Hund Katze Maus Elefant Tiger)

for i in ${myArray[@]}; do
	echo $x. $i
	x=$[$x+1]
 done
