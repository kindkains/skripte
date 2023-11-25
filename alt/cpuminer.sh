#!/bin/bash
vers=2.4.5

clear
echo "Installiere notwendige Pakete:"
sudo apt-get install build-essential libcurl4-openssl-dev
sleep 1

echo ""
echo "Wechsel in das Verzeichnis /opt"
cd /opt/
sleep 1

echo "Lade cpuminer herunter:"
wget https://github.com/pooler/cpuminer/releases/download/v2.4.5/pooler-cpuminer-$vers.tar.gz
sleep 1

echo ""
echo "Entpacke cpuminer"
unp pooler-cpuminer-*
sleep 1

echo ""
echo "Wechsel ins Verzeichnis cpuminer-$vers"
cd cpuminer-$vers
sleep 1

echo ""
echo "Kompiliere den minerd"
sleep 1
./configure CFLAGS="-O3"
make

echo ""
echo ""
/root/skripte/minerd.sh
