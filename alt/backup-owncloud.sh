#!/bin/bash
BLACK=`tput setaf 0`
ROT=`tput setaf 1`
GRUEN=`tput setaf 2`
GELB=`tput setaf 3`
BLAU=`tput setaf 4`

clear

echo "${ROT}Sichere KeePassX nach Owncloud${GRUEN}"
sudo rsync -avP /home/sandro/KeePassX/ /backup/owncloud/KeePassX/
echo ""
echo ""
sleep 1

echo "${ROT}Sichere Multibit-Backup-Cloud nach Owncloud${GRUEN}"
sudo rsync -avP /backup/Multibit-Backup/ /backup/owncloud/MultiBitHD
echo ""
echo ""
sleep 1

echo "${ROT}Sichere Skripte nach Owncloud${GRUEN}"
sudo rsync -avP /home/sandro/skripte/ /backup/owncloud/Skripte/
echo ""
echo ""
sleep 1

echo "${ROT}Sichere gpg4usb nach Owncloud${GRUEN}"
sudo rsync -avP /home/sandro/gpg4usb/ /backup/owncloud/gpg4usb/
echo ""
echo ""
sleep 1

echo "${ROT}Sichere GnuPG Schlüssel nach Owncloud${GRUEN}"
sudo rsync -avP /home/sandro/Dokumente/GnuPG/ /backup/owncloud/GnuPG/
echo ""
echo ""
sleep 1

echo "${ROT}Syncrhonisiere PL-Owncloud mit Inka-Owncloud${GRUEN}"
sudo rsync -avP /backup/owncloud/ /backup/owncloud-inka/
echo ""
echo ""
sleep 1

echo "Backup der Workstation wurde erfolgreich durchgefuehrt" | /usr/bin/sendemail -o tls=no -u "Linux Mint Backup erfolgreich" -f "root@`uname -n`" -t "sandro.isoletta@pl.rlp.de" -s vmail2.bildung-rp.de
