#! /bin/bash
d=`date +%H:%M:%S`
tmux new-session -d -s MeinTmux_$d '/root/skripte/update.sh'
