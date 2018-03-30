#!/bin/bash


#Check to see if numbers are in range
if [ $1 -lt 1 ] || [ $1 -gt 10 ]
	then
	echo "Numbers outside range. Pick number between 1 and 9."

else
	#loop for each number (rows)
	for((row=1;row<=$1;row++))
	do 
	#required spaces
	for ((spaces=row;spaces<=$1;spaces++))
	do 
	echo -ne ""
	done

	#Print values
	for ((j=1;j<=row;j++))
	do 
	echo -ne "$row"
	done
	#newline
	echo 
	done
fi

