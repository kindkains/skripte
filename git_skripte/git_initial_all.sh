#!/bin/bash

projekt=(git_kurs git_neu.sh inka-online php pokora rpg skripte spielwiese)

for i in ${projekt[@]}; do
	cd /home/sandro/git/${i}
	git init
	git add .
	git commit -m "initial commit for ${i}"
	git remote add origin git@paqo.de:/opt/git/myRepos/${i}.git
	git push origin master
	cd /home/sandro/git
 done
