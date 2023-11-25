#!/bin/bash
sudo truecrypt --mount /home/sandro/Dokumente/GnuPG/Geheimnis /mnt/secret/
rsync -avP /home/sandro/Dokumente/GnuPG/Walter_White/ /mnt/secret/
sudo truecrypt -d
rm -rf /home/sandro/Dokumente/GnuPG/Walter_White/*
sudo pm-suspend
xtrlock
