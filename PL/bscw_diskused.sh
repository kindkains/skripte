#!/bin/sh

# update (re-calculate) BSCW database disk usage
/srv/bscw/srv/bscw.bildung-rp.de/bin/bsadmin du -u

# Textdatei mit gewünschten Daten erzeugen
/srv/bscw/srv/bscw.bildung-rp.de/bin/bsadmin du > /root/skripte/discused.txt
echo "                                                                                                  " >> /root/skripte/discused.txt
echo "--------------------------------------------------------------------------------------------------" >> /root/skripte/discused.txt
echo "                                                                                                  " >> /root/skripte/discused.txt
df -h >> /root/skripte/discused.txt

# Email an it-status mit Inhalt der erzeugten Textdatei
cat /root/skripte/discused.txt | /usr/bin/sendemail -o tls=no -u "BSCW Speicherplatznutzung `uname -n`" -f "bsadmin@`uname -n`" -t it-status@pl.rlp.de
