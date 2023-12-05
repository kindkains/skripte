#!/bin/bash
d=`date +%d.%m.%y_%H:%M`

git add .
git commit -m "Commit Engel $d"
git push origin master
sync
