#!/bin/bash
clear
echo "Starte Mining"
echo "============="
echo ""
echo ""
/opt/cpuminer-2.4.5/minerd -q --url=stratum+tcp://litecoinpool.org:3333 --userpass=kindkains.1:1 &
