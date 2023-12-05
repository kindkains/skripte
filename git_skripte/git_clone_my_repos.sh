#!/bin/bash

# Mittels dieses Skript werden alle auf meinem eigenen Git-Server zur Verfügung stehenden Repositorys
# in das Verzeichnis geklont, in welchem das Skript ausgeführt wird. Beizeiten müsste die Array Variable
# x angepasst werden, falls mehr Repos unter paqo.de:/opt/git/myRepos/ hinzugekommen sind.

x=(bash_skript.git engel.git git_kurs.git inka-online.git php.git pokora.git rpg.git spielwiese.git)

for i in ${x[@]}; do
	git clone git@paqo.de:/opt/git/myRepos/${i}
done
