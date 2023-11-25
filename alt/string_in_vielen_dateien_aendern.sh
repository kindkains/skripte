#!/bin/sh

# Dieses Skript ist dazu gedacht, um einen bestimmten String (ALT) durch einen
# anderen (NEU) zu ersetzen und zwar innerhalb mehrerer Dateien in einem Verzeichnis

WORKDIR=/tmp/test/
ALT="test"
NEU="Ficken"

cd $WORKDIR
for i in `ls`
do
   mv $i $i.tmp
   cat $i.tmp | sed -e "s/$ALT/$NEU/g" >> $i
   rm $i.tmp
done


# Diese zweite Variante arbeitet genauso wie die erste nur mit dem Unterschied,
# dass man nur Dateien ändert, welche mit einer bestimmten Dateiendung
# (in diesem Fall html) enden.

#WORKDIR=/PFAD/ZUM/VERZEICHNIS/
#ALT="test"
#NEU="Test"
#
#cd $WORKDIR
#for i in `ls *.[hH][tT][mM][lL]`
#do
#   mv $i $i.tmp
#   cat $i.tmp | sed -e "s/$ALT/$NEU/g" >> $i
#   rm $i.tmp
#done
