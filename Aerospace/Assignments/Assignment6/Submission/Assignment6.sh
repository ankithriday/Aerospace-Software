#!/bin/bash

# Ankit Hriday, Robert Hakulin
# Assignment-6 main bash script
for i in 0 10 100 1000 5000 10000 50000 100000
do
echo "Calculating Objective 1: Clearance = $i m ; Accuracy = 0.5"
gcc -c Apollo13.c Optimizer.c Eulers.c ConditionCheck.c -lm
gcc -o ThreeBody Apollo13.o Optimizer.o Eulers.o ConditionCheck.o -lm
./ThreeBody 1 $i 0.5 -lm
done



for i in 0 10 100 1000 5000 10000 50000 100000
do
echo "Calculating Objective 2: Clearance = $i m ; Accuracy = 0.5"
gcc -c Apollo13.c Optimizer.c Eulers.c ConditionCheck.c -lm
gcc -o ThreeBody Apollo13.o Optimizer.o Eulers.o ConditionCheck.o -lm
./ThreeBody 2 $i 0.5 -lm
done

