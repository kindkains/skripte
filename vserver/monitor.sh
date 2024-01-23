#!/bin/bash

SOURCE_DIR=/var/www/nextcloud/data/sandro/files/crypt
DEST_DIR=/data/Klartext

inotifywait -m -r -e create -e moved_to --format "%w%f" "$SOURCE_DIR" | while read FILE
do
    mv "$FILE" "$DEST_DIR"
done

