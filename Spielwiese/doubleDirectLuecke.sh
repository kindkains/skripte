#!/bin/bash

echo "Bitte als Root ausführen"

# DoubleDirect Lücke deaktivieren
#echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

# DoubleDirect Lücke aktivieren
echo 1 > /proc/sys/net/ipv4/conf/all/accept_redirects


# Siehe https://www.youtube.com/watch?v=lJYjpdnA8D4
