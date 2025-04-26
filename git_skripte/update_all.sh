#!/bin/bash

error() {

	echo ""
	echo "${ROT}"
	echo "Fehlerhafte Eingabe, Programm wird beendet"
	echo "${T}"
	echo ""
	exit;
}

update() {
	
	cd $git
        for i in ${x[@]}; do

                echo "Wechsle nach ${BLAU}${i}${T}"
                cd $i
                ./update_${i}.sh
                cd ..
                echo "Fertig mit $i"
                echo
                echo
        done
}

git="/home/sandro/git"
ROT=`tput setaf 1`
BLAU=`tput setaf 4`
T=`tput setaf 9`
x=(bash_skript engel git_kurs inka-online php pokora rpg skripte spielwiese)		# Alle relevanten Repos eintragen

clear
read -p "Pfad der zu aktualisierenden Git-Repos ist $git ${BLAU}<j/n>${T} " y
echo

if [ "$y" == "j" ]; then

	git="/home/sandro/git"
	cd $git
	update

elif [ "$y" == "n" ]; then

	read -p "Pfad der Git-Repos: " git
	cd $git
	update
else
	error
fi
echo ${T}
exit 0
