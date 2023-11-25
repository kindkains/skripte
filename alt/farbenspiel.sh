# Quelle: http://wiki.linux-club.de/opensuse/Farbe_in_der_Konsole

BLACK=`tput setaf 0`
ROT=`tput setaf 1`
BLAU=`tput setaf 4`
GELB=`tput setaf 3`

echo "Das hier ist ein Text der durch ${ROT}rote${BLACK} durch ${BLAU}blaue ${BLACK}" 
echo "und ${GELB}gelbe ${BLACK} Worte ${ROT}unterbrochen ${BLACK}ist."
