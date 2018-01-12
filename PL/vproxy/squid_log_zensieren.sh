#!/bin/bash
# Mit grep -v wird das Suchergebnis invertiert, also es wird die ganze Datei temporär zwischen
# gespeichert, OHNE die gefunden Treffer (also ohne die angegebenen IP Adresse)
grep -v  172.30.24.12 /var/log/squid3/access.log > /root/skripte/temp
grep 172.24.30.120 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.121 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.122 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.123 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.124 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.125 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.126 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.127 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.128 /var/log/squid3/access.log >> /root/skripte/temp
grep 172.24.30.129 /var/log/squid3/access.log >> /root/skripte/temp

# Anschließend wird der Inhalt der originalen Logdatei mit dem Inhalt der temporären Datei
# überschrieben. Auf diese Weise kann der Squid normal weiter loggen, ohne neu gestartet werden 
# zu müssen
cat temp > /var/log/squid3/access.log

# Zum Schluß wird die temporäre Datei entfernt
rm /root/skripte/temp
