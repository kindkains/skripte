#!/bin/bash
clear

echo "Schreibweise:"
echo "echo -e dann \033 dann [ZAHLm dann beliebiger Test dann \033 und zuletzt [0m"
echo
echo -e "\033[31mBeispiel:"
echo -e "Roter Text mit Farbcode 31m"
echo -e "\033[0m"
echo  
echo "Der Farbcode 0m hebt dies dann wieder auf"
echo

for i in {0..7}
do
	echo -e "\033[${i}mFarbcode_${i}m\033[0m"
done

echo -e "\033[9mFarbcode_9\033[0m"

for i in {30..47}
do
	echo -e "\033[${i}mFarbcode_${i}m\033[0m"
done

for i in {90..107}
do
	echo -e "\033[${i}mFarbcode_${i}m\033[0m"
done

echo
