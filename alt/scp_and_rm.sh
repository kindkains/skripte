#!/bin/bash
clear
echo "#################################################"
echo "#                                               #"
echo "# Inhalt eines Ordners via SCP kopieren und die #"
echo "# kopierten Dateien im Anschluß direkt löschen. #"
echo "#                                               #"
echo "#################################################"
echo ""
echo ""

echo "Benutzer des entfernten Rechners: "
read user
echo ""
echo "Name oder IP des entfernten Rechners: "
read host
echo ""
echo "Quellordner: "
read dir
echo ""
echo "Zielordner: "
read pfad

#dir=/home/sandro/jdownloads/test
#pfad=/

for i in `ls $dir`;do scp $dir/$i $user@$host:$pfad && rm $dir/$i && echo "Fertig. $i wurde kopiert und gelöscht" && echo"" && echo "";done
