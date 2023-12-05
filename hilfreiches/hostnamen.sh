#!/bin/bash
clear
echo "IP DNS Server: "
read DNS
echo
echo "Zu welcher IP soll ich den Hostnamen ausgeben? "
read IP
echo
dig -x $IP +short @$DNS
echo
