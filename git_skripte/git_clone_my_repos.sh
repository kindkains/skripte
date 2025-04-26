#!/bin/bash

x=(bash_skript.git engel.git git_kurs.git inka-online.git php.git pokora.git rpg.git spielwiese.git)

for i in ${x[@]}; do
	git clone git@paqo.de:/opt/git/myRepos/${i}
done
