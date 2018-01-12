#!/bin/bash
clear
echo "#################################################"
echo "#                                               #"
echo "# Inhalt eines Ordners via SCP kopieren und die #"
echo "# kopierten Dateien im Anschluss direkt löschen#"
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

for i in `ls $dir`
	do
		if scp $dir/$i $user@$host:$pfad;then
			rm $dir/$i
			echo "Fertig - $i wurde kopiert und gelöscth"
			echo ""
		else
			echo "Fehler beim Kopieren"
			echo ""
			exit 1;
		fi
	done
