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
			if ssh $user@$host -C "if [ -f $pfad/$i ]";then
				echo "Erfolgreich kopiert"
				ssh $user@$host -C "ls -lah $pfad/$i"
#				rm $dir/$i
			else
				echo "Fehler beim Kopieren"
				echo ""
				exit 1;
			fi
		fi
	done
