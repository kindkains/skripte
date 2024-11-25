#!/bin/sh

check_mnt(){
    MOUNT=$1
    FILE=$2

    if test -e ${PFAD}/${FILE}; then
        echo "${PFAD}/$MOUNT ist gemountet"
        return 0
    else
        echo "${PFAD}/${MOUNT} ist nicht gemountet, versuche die Festplatte einzuhängen:"
        MNT=${PFAD}
        sudo mount $MNT
        if test $? -eq 0; then
            echo "Mount $PFAD hat geklappt"
            return 1
        else
            echo "Mount $PFAD hat nicht geklappt"
            return 2
        fi
    fi
}

action(){
    if test $1 -eq 0; then
        echo "War schon eingehangen"
    else
        if test $1 -eq 1; then
            echo "War nicht eingehangen, konnte aber erfolgreich eingehangen werden"
        else
            echo "Fehler beim Einhängen, Festplatte nicht erreichbar!"
        fi
    fi
}

PFAD=/home/sandro/Atmosfear
check_mnt Atmosfear checkOK
myCheck=$?
action $myCheck
