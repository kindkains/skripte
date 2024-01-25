#!/bin/bash
# pidof: 0 = läuft, 1 = läuft nicht

d=`date +%d.%m.%y`
t=`date +%H:%M`
x=`pidof node /opt/etherpad-lite/node_modules/ep_etherpad-lite/node/server.js`;
log=/var/log/etherpad/etherpad_restart.log

echo ""

if [ "$x" == "" ];
	then
		echo "Datum: $d" 2>&1 | tee $log
		echo "Uhrzeit: $t" 2>&1 | tee $log
		echo "" 2>&1 | tee $log
		echo "Etherpad unerwartet beendet, starte Prozess neu" 2>&1 | tee $log
		echo "" 2>&1 | tee $log
		/opt/etherpad-lite/bin/run.sh >> $log &
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
