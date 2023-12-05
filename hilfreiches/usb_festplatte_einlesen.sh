#!/bin/bash

# Dieses Skript liest meine USB Festplatte wieder neu ein
# Zudem ist sie ein Beispielcode für die Verwendung von einer For-Schleife
# mit 2 Variablen, da
#
# for i in {$START..$END};
#
# zu einem Fehler führt

START=0
END="$(ls /sys/class/scsi_host/ | wc -l)"
END=$[END-1]

for i in $(eval echo "{$START..$END}"); do echo "- - -" > /sys/class/scsi_host/host$i/scan; echo $i; done
