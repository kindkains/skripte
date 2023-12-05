#!/bin/bash
clear
echo "Sichere /home"
# sudo rsync -avP --exclude=~/Netzlaufwerk-Gemeinsam --exclude=~/Netzlaufwerk --exclude=~/.cache --exclude=~/.local/share/Trash /home /backup
sudo rsync -avP --exclude-from=/home/sandro/skripte/backup-exclude /home /backup
echo ""
echo ""
sleep 1

echo "Sichere /etc"
sudo rsync -avP /etc /backup
echo ""
echo ""
sleep 1

echo "Sichere /root"
sudo rsync -avP /root /backup
echo ""
echo ""
sleep 1

echo "Sichere /opt"
sudo rsync -avP /opt /backup
echo ""
echo ""
sleep 1

echo "Sichere /usr"
sudo rsync -avP /usr /backup
echo ""
echo ""
sleep 1

echo "Sichere Multibit-Backup-Cloud nach Owncloud"
sudo rsync -avP /backup/Multibit-Backup/ /backup/owncloud/MultiBitHD
echo ""
echo ""
sleep 1

echo "Sichere Skripte nach Owncloud"
sudo rsync -avP /home/sandro/skripte/ /backup/owncloud/Skripte/
echo ""
echo ""
sleep 1

echo "Sichere gpg4usb nach Owncloud"
sudo rsync -avP /home/sandro/gpg4usb/ /backup/owncloud/gpg4usb/
echo ""
echo ""
sleep 1

echo "Sichere GnuPG Schlüssel nach Owncloud"
sudo rsync -avP /home/sandro/Dokumente/GnuPG/ /backup/owncloud/GnuPG/
echo ""
echo ""
sleep 1

echo "Syncrhonisiere PL-Owncloud mit Inka-Owncloud"
sudo rsync -avP /backup/owncloud/ /backup/owncloud-inka/
echo ""
echo ""
sleep 1

echo "Backup der Workstation wurde erfolgreich durchgefuehrt" | /usr/bin/sendemail -o tls=no -u "Linux Mint Backup erfolgreich" -f "root@`uname -n`" -t "sandro.isoletta@pl.rlp.de" -s vmail2.bildung-rp.de
