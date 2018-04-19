#!/bin/bash
# Ankit Hriday
# April 9, 2018
# Assignment-7 1.2

#These are all the possible combinations between the three matrices. 
#they will be run through the mat_ops code and the value of the
# operations will be saved in the given naming convention. 
cp functions.c $1
cp FUNCTIONS.h $1
cp mat_ops.c $1
cp tester.c $1
cp write_to_file.c $1
cd $1
gcc -o mat_ops mat_ops.c functions.c write_to_file.c -lblas -lgfortran 

printf "Calculating all possible permutations\n" 
./mat_ops A B C
./mat_ops A C B
./mat_ops B A C
./mat_ops B C A
./mat_ops C A B
./mat_ops C B A

echo "Finished with all the permutations. Check the output files."
