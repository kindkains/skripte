#!/bin/bash

# mit dem Skript halloween.sh wird ein zufälliges Video aus dem Verzeichnis
# /home/sandro/Atmosfear bzw. dessen Unterordner abgespielt.
# ruft man es als halloween.sh loop auf, dann werden ALLE Videos zufällig abgespielt
# Der Pfad muss hierfür korrekt eingehangen sein: sudo mount /home/sandro/Atmosfear

Vidir="/home/sandro/Atmosfear"
VideoDBFile="/home/sandro/Halloween/videos.db"
LoopDBFile="/home/sandro/Halloween/loop.db"
PFAD=/home/sandro/Atmosfear

# Funktion zur Anzeige der Hilfe
show_help() {
    echo
    echo "Verwendung: $0 [OPTION]"
    echo "Spielt zufällig ein Video aus dem Verzeichnis ab oder alle Videos in zufälliger Reihenfolge."
    echo
    echo "Optionen:"
    echo " -loop    Alle Videos in zufälliger Reihenfolge abspielen und wiederholen"
    echo "  -h, -help, -?  Diese Hilfe anzeigen"
    echo
    echo
    exit 0
}

check_mnt(){
    MOUNT=$1
    FILE=$2

    if test -e ${PFAD}/${FILE}; then
        return 0
    else
        MNT=${PFAD}
        sudo mount $MNT
        if test $? -eq 0; then
            return 1
        else
            return 2
        fi
    fi
}

action(){
    if test $1 -eq 0; then
        echo ""
    else
        if test $1 -eq 1; then
            echo ""
        else
            echo "$PFAD ist nicht eingehangen"
        fi
    fi
}

# Videos laden und in die Video-Datenbank schreiben
load_videos_to_db() {
    find "$Vidir" -type f -print0 | while IFS= read -r -d '' file; do
        echo "$file" >> "$VideoDBFile"
    done
}

# Videos aus der Video-Datenbank laden
load_videos_from_db() {
    IFS=$'\n' read -d '' -r -a MyVideos < "$VideoDBFile"
}

# Zufällige Reihenfolge der Videos in die Loop-Datenbank schreiben
shuffle_videos_to_loop_db() {
    shuf "$VideoDBFile" > "$LoopDBFile"
}

# Videos aus der Loop-Datenbank laden
load_videos_from_loop_db() {
	check_mnt Atmosfear checkOK
	myCheck=$?
	action $myCheck
	IFS=$'\n' read -d '' -r -a MyVideos < "$LoopDBFile"
}

# Zufälliges Video abspielen
play_random_video() {
    Video="${MyVideos[$RANDOM % ${#MyVideos[@]}]}"
    cvlc --fullscreen --no-mouse-events --no-osd --no-video-title-show --no-video-deco --no-embedded-video --play-and-exit "$Video"
}

# Alle Videos in zufälliger Reihenfolge abspielen
play_all_videos_loop() {
    while true; do
        shuffle_videos_to_loop_db
        load_videos_from_loop_db
        for Video in "${MyVideos[@]}"; do
            cvlc --fullscreen --no-mouse-events --no-osd --no-video-title-show --no-video-deco --no-embedded-video --play-and-exit "$Video"
        done
    done
}

# Hauptskript
case "$1" in
    -h|-help|-?)
        show_help
        ;;
    loop)
        if [ ! -f "$VideoDBFile" ]; then
		load_videos_to_db
        fi
	play_all_videos_loop
        ;;
    *)
        if [ ! -f "$VideoDBFile" ]; then
		load_videos_to_db
        fi
	load_videos_from_db
        play_random_video
        ;;
esac


