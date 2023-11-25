#!/bin/bash
echo "Stoppe Proxy"
/etc/init.d/squid3 stop
echo "Stoppe c-icap"
/etc/init.d/c-icap stop
echo "Stoppe Antivirus"
/etc/init.d/clamav-daemon stop
/etc/init.d/clamav-freshclam stop
echo "Alle Dienste angehalten."
echo""
echo "Starte Antivirus"
/etc/init.d/clamav-freshclam start
/etc/init.d/clamav-daemon start
echo "Starte c-icap"
/etc/init.d/c-icap start
echo "Starte Proxy"
/etc/init.d/squid3 start
echo "Alle Dienste wurden neu gestartet."
