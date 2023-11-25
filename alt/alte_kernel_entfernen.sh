#/bin/bash
clear

echo "Der aktuell geladene Kernel ist:"
uname -a
echo ""
echo ""
sleep 1

echo "Folgende Kernel dürften entfernt werden:"
dpkg -l 'linux-[ihs]*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\([-0-9]*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | tee zu_entfernende_Kernel 
echo ""
echo ""
sleep 1

echo "Die alten Kernel-Versionen werden jetzt entfernt:"
echo "cat zu_entfernende_Kernel | xargs sudo apt-get -y purge"
echo ""
cat zu_entfernende_Kernel | xargs sudo apt-get -y purge 
echo ""
echo "Fertig"
echo ""
echo ""
sleep 1
rm zu_entfernende_Kernel
