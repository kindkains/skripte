#!/bin/bash
d=`date +%d.%m.%y_%H:%M`

git add .
git commit -am "Commit Engel $d"
git push origin master
/root/bin/sync
