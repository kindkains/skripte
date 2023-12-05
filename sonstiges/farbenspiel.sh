# Quelle: http://wiki.linux-club.de/opensuse/Farbe_in_der_Konsole

BLACK=`tput setaf 0`
ROT=`tput setaf 1`
GRUEN=`tput setaf 2`
GELB=`tput setaf 3`
BLAU=`tput setaf 4`
LILA=`tput setaf 5`
CYAN=`tput setaf 6`
WEISS=`tput setaf 7`
TERMINAL=`tput setaf 9`			# Das ist das Standard Grün, welches ich für gewöhnlich im Terminal verwende

echo ""
echo "Das hier ist ein Text der durch ${BLACK}schwarze,${ROT}rote,${BLAU}blaue,${GELB}gelbe, ${GRUEN}grüne,${LILA}violette,${CYAN}hellblaue,"
echo "${WEISS}weiße und ${TERMINAL} Terminal-Grüne Worte unterbrochen ist."
echo ""
echo ""
