#!/bin/bash
# Demonstriert die select-Anweisung
# aselect1

select auswahl in Punkt1 Punkt2 Punkt3 Punkt4
do
   echo "Ihre Auswahl war : $auswahl"
done
