#!/bin/bash

echo
read -p "Projektnamen eingeben: " projekt
echo

cd $projekt
git init
git add .
git commit -m 'initial commit for $projekt'
git remote add origin git@paqo.de:/opt/git/myRepos/$projekt.git
git push origin master
cd ..
