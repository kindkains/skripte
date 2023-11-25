#!/bin/bash
sudo truecrypt --mount /home/sandro/Dokumente/GnuPG/Geheimnis /mnt/secret/
rsync -avP /home/sandro/Dokumente/GnuPG/Walter_White/*.txt /mnt/secret/Bestellungen/
cat /home/sandro/Desktop/chat >> /mnt/secret/chat
echo "" > /home/sandro/Desktop/chat
sudo truecrypt -d
scp /home/sandro/Dokumente/GnuPG/Geheimnis nas@pi:/media/HDD1/home/sandro/Dokumente/GnuPG/Geheimnis
rm -f /home/sandro/Dokumente/GnuPG/Walter_White/*
xtrlock
