#!/bin/bash
# Ankit Hriday
# Bonus Question
# 29th March, 2018

# Check if Numbers are in range or not
if [ $1 -lt 1 ] || [ $1 -gt 10 ]
	then
	echo "Number is outside the given ange. Pick number between 1 and 9."

else
	# Loop for each number in the row
	for((row=1;row<=$1;row++))
	do 
	# spaces required to be in the given format
	for ((spaces=row;spaces<=$1;spaces++))
	do 
	echo -ne ""
	done

	# Print out the values
	for ((j=1;j<=row;j++))
	do 
	echo -ne "$row"
	done
	# adds new line
	echo 
	done
fi