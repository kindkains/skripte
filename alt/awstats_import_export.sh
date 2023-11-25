#!/bin/bash
clear
cd /home/sandro/skripte/
echo "Kopiere apache2-vlbs-web1.tar.gz und awstats-vlbs-web1.tar.gz vom vlbs-web1 hierher."
sleep 2
scp vmadmin@vlbs-web1:/home/vmadmin/*vlbs-web1.tar.gz .
echo ""
echo "Kopiere apache2-vlbs-web1.tar.gz und awstats-vlbs-web1.tar.gz von hier zum vlbs-stats."
sleep 2
scp *vlbs-web1.tar.gz vmadmin@vlbs-stats:/home/vmadmin/
echo ""
clear
echo "Lösche apache2-vlbs-web1.tar.gz und awstats-vlbs-web1.tar.gz von hier."
sleep 1
rm -rf apache2-vlbs-web1.tar.gz awstats-vlbs-web1.tar.gz
echo ""
echo "Lösche apache2-vlbs-web1.tar.gz und awstats-vlbs-web1.tar.gz vom vlbs-web1."
sleep 2
ssh -q vmadmin@vlbs-web1 rm -rf apache2-vlbs-web1.tar.gz awstats-vlbs-web1.tar.gz
echo ""
echo "Verbinde mich nun mit dem vlbs-stats (pw: Ugaixae0)."
sleep 5
ssh vmadmin@vlbs-stats
