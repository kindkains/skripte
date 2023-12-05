#!/bin/bash

# Benötigtes Paket
apt-get install rename

# dryrun
rename -n 's/\s/_/g' *

# Umbenennung
rename 's/\s/_/g' *
