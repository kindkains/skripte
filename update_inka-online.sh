#!/bin/bash
d=`date +%d.%m.%y_%H:%M`

git add .
git commit -am "Commit Inka-Online $d"
git push origin master
/root/bin/sync
