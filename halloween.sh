#!/bin/bash

Vidir=~/Videos

# Array MyVideos mit Dateinamen aus /home/pi/atmosFx füllen
declare -a MyVideos=($(ls $Vidir))

# echo ${MyVideos["$[RANDOM % ${#MyVideos[@]}]"]}

# Zufällig Ausgabe eines Videotitels aus dem Array MyVideos
# und diesen Wert in die Variable Video schreiben
Video=($(echo ${MyVideos["$[RANDOM % ${#MyVideos[@]}]"]}))

# VLC Player öffnen und mit zufälligen Videotitel aus der Liste starten, dann beenden
cvlc "$Vidir/$Video" --fullscreen --no-mouse-events --no-osd --no-video-title-show --play-and-exit
