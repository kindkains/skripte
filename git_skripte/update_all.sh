#!/bin/bash

# Dieses Skript wird alle lokalen Repositorys, welche sich direkt unterhalb dieses Skriptes befinden
# (bsp: skript liegt in /home/git/ und Repos in /home/git/repo1 /home/git/repo2 usw.)
# aktualisieren und mit meinem Git-Server synchronisieren.

# Hierzu werden lokal Dateiänderungen mit git add . hinzugefügt und commitet und dann git push origin master ausgeführt.
# Anschließend wird das Skript ~/bin/sync ausgeführt, welches mittels 

# Dieses Skript wird alle lokalen Repositorys, welche sich direkt unterhalb dieses Skriptes befinden
# (bsp: skript liegt in /home/git/ und Repos in /home/git/repo1 /home/git/repo2 usw.)
# aktualisieren und mit meinem Git-Server synchronisieren.

# Hierzu werden lokal Dateiänderungen mit git add . hinzugefügt und commitet und dann git push origin master ausgeführt.
# Anschließend wird das Skript ~/bin/sync ausgeführt, welches mittels pssh den Befehl 
#
# /usr/bin/parallel-ssh -H git@paqo.de -P sync
#
# auf meinem Git-Server durchführt. sync ist hierbei erneut nur ein Skript, welches für alle relevanten Repositorys ein
# git pull auf dem Server ausführt. 


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
		git add .
		git commit -m "Commit $i $d"
		git push origin master
                cd ..
                echo "Fertig mit $i"
                echo
        done
	sync
}

git="/home/sandro/git"
ROT=`tput setaf 1`
BLAU=`tput setaf 4`
T=`tput setaf 9`
d=`date +%d.%m.%y_%H:%M`
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
