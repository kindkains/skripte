#!/bin/bash
sudo truecrypt --mount /home/sandro/Dokumente/GnuPG/Geheimnis /mnt/secret/
sudo rsync -avP /home/sandro/Dokumente/GnuPG/Walter_White/ /mnt/secret
rsync -avP /home/sandro/Dokumente/GnuPG/Walter_White/ nas@isoletta.dd-dns.de:/media/HDD1/home/sandro/Dokumente/GnuPG/Walter_White/
sudo truecrypt -d
rsync -avP /home/sandro/Dokumente/GnuPG/Geheimnis nas@isoletta.dd-dns.de:/media/HDD1/home/sandro/Dokumente/GnuPG/
