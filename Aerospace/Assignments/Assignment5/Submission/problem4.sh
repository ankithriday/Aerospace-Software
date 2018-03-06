# Ankit Hriday
# Assignment 5- Problem4

echo The Filename used is $1
cat $1 | cut -d ";" -f 2 | awk 'BEGIN {sum=0.0; avg=0.0; count=0.0} {sum+=$1; count++} END {avg=sum/count; printf "The Average Score is  %.2f\n", avg}'

exit 0
