#!/bin/bash
d=`date +%d.%m.%y`
clamscan -r -l /var/log/clamav/routinescan-home-$d.txt /home
clamscan -r -l /var/log/clamav/routinescan-etc-$d.txt /etc
clamscan -r -l /var/log/clamav/routinescan-var-$d.txt /var
clamscan -r -l /var/log/clamav/routinescan-opt-$d.txt /opt
clamscan -r -l /var/log/clamav/routinescan-srv-$d.txt /srv
clamscan -r -l /var/log/clamav/routinescan-boot-$d.txt /boot
clamscan -r -l /var/log/clamav/routinescan-media-$d.txt /media
clamscan -r -l /var/log/clamav/routinescan-usr-$d.txt /usr
clamscan -r -l /var/log/clamav/routinescan-lib-$d.txt /lib
clamscan -r -l /var/log/clamav/routinescan-lib32-$d.txt /lib32
clamscan -r -l /var/log/clamav/routinescan-lib64-$d.txt /lib64
echo "Scan fertig"
/root/skripte/test.sh
