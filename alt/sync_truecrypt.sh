#!/bin/bash
sudo truecrypt -d
sudo truecrypt --mount /home/sandro/Dokumente/GnuPG/Geheimnis /mnt/secret/
sudo rsync -avP /home/sandro/Dokumente/GnuPG/Walter_White/ /mnt/secret/
sudo truecrypt -d
echo ""
echo ""
read -p "Soll /home/sandro/Dokumente/GnuPG/Walter_White/* gelöscht werden? (ja oder nein? )" x

if [ $x = "ja" ]; then
	rm -rvf /home/sandro/Dokumente/GnuPG/Walter_White/*
	echo "Inhalt von Walter_White wurde gelöscht"
	echo ""
	sleep 1
	ls -lah /home/sandro/Dokumente/GnuPG/Walter_White/
	echo ""
	echo ""
	echo "Fertig"

else
	echo ""
	echo ""
	echo "Inhalt von Walter_White wurde NICHT gelöscht!"
	echo ""
	echo ""
	echo "Fertig"
fi
