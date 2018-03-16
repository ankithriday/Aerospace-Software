######################################
#######      READ ME     #############
######################################

To compile on linux run:
1.)	gcc -c Apollo.c Eulers.c ConditionCheck.c Optimizer.c -lm
2.)	gcc -o ThreeBody Apollo.o Eulers.o ConditionCheck.o Optimizer.o -lm

To run ThreeBody
1.)	./ThreeBody OBJ CLEARANCE TOLERANCE

Output files are written in /Output and the matlab script needed for plotting/pngs of plots are located there