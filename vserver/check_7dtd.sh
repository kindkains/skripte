#!/bin/bash
# pidof: 0 = läuft, 1 = läuft nicht

d=`date +%d.%m.%y`
t=`date +%H:%M`
x=`pidof ./7DaysToDieServer.x86_64`;
log=/var/log/7dtd/7dtd_restart.log

echo ""

if [ "$x" == "" ];
	then
		echo "Datum: $d" 2>&1 | tee $log
		echo "Uhrzeit: $t" 2>&1 | tee $log
		echo "" 2>&1 | tee $log
		echo "7 Days To Die unerwartet beendet, starte Prozess neu" 2>&1 | tee $log
		echo "" 2>&1 | tee $log
		/home/sandro/bin/go.sh >> $log &
		echo "-----------------------------------------------" 2>&1 | tee $log
		echo "-----------------------------------------------" 2>&1 | tee $log
		echo "-----------------------------------------------" 2>&1 | tee $log 
		echo "" 2>&1 | tee $log 
		echo "" 2>&1 | tee $log 
	else
		exit
echo ""
fi

exit 0
