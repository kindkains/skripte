#!/bin/bash
echo ""
echo -e "\033[31mAchtung:\033[0m Laut Ubuntu, soll der Befehl \033[35mntpdate\033[0m nicht mehr verwendet werden"
echo "for i in {1..1000}; do ntpdate; done"
echo ""
echo -e "Besser ist wohl das einmalige Ausführen des Befehls \033[35mntpd -q -g -x -n\033[0m"
echo ""
