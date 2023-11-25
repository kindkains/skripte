#!/bin/bash

# Dieses kleine Skript ersetzt innerhalb eines Ordners sämtliche Leerzeichen in den Dateien durch einen
# Unterstrich _ 

rename 's/ /_/g'  *  .*

# Wenn auch Unterverzeichnisse mit einbezogen werden sollen, so lautet der Befehl:
# find . -depth -execdir rename 's/ /_/g' {} +
