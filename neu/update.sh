#!/bin/bash
d=`date +%d.%m.%y`
key=/root/.ssh/id_rsa_pi

local(){
	logfile=/var/log/cronjobs/odroid_update.log
        echo "Last Run: $d" | tee -a $logfile
	echo "-------------------" | tee -a $logfile
	echo "" | tee -a $logfile

        apt-get update | tee -a $logfile
	echo "" | tee -a $logfile
        apt-get upgrade -y | tee -a $logfile

        return 0;
}

remote(){
	logfile=/var/log/cronjobs/$1_update.log
	echo "Last Run: $d" | tee -a $logfile
	echo "-------------------" | tee -a $logfile
        echo "" | tee -a $logfile

	ssh root@$1 -i $key -t "apt-get update | tee -a $logfile && echo "" | tee -a $logfile && apt-get upgrade -y | tee -a $logfile"

	return 0;
}


local
remote pihole
