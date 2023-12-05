#!/bin/bash
#find / -name "*~" -ok rm "{}" \;
rsync -avP /backup/home/ /home/
rsync -avP /backup/etc/ /etc/
rsync -avP /backup/root/ /root/
rsync -avP /backup/opt/ /opt/
echo "Backup der Workstation wurde erfolgreich zurück gespielt!" | /usr/bin/sendemail -o tls=no -u "Linux Mint Backup erfolgreich" -f "root@`uname -n`" -t "sandro.isoletta@pl.rlp.de" -s vmail2.bildung-rp.de
