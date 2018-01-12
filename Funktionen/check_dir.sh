#!/bin/bash
clear

# Funktionen definieren

check_dir () {
	if [ `ls -d $dir` ] 2> /dev/null; then

		echo
		echo "Directory "$dir" exist"
		echo 
		return 0;
	else
		echo 
		echo "Directory "$dir" not found"
		echo
		return 1;
fi
}

read -p "Enter directory to check: " dir
check_dir
