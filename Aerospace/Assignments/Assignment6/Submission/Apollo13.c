#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include"Eulers.h"
#include"Optimizer.h"

/*##################################################################################################
#	Robert Hakulin
# 	ASEN 4057 Assignment 6
# 	Date Created: March 7, 2018
#
# 	This C program will optimize a user specified objective and return a data file for Matlab use
#
# 	Inputs: Objective 1 or 2, accuracy tolerance, and minimum passing distance from moon
# 	Outputs: Data file for matlab use
##################################################################################################*/


// Initialize Main with arc and argv[] which are used for command line inputs
int main(int argc, char *argv[])
{

	// Initialize output array pointers;
	double *pDv = malloc(2*sizeof(double));
	double *temp = malloc(2*sizeof(double));
	double dvx = 0, dvy = 0;

	// Initialize all command line inputs as local C variables and ensures that they are correct
	int obj;
	obj = atoi(argv[1]);
	if(obj != 1 && obj != 2){
		printf("\nINPUT ERROR:\tObjective number %d is not recognized (use 1 or 2)\n\n",obj);
		return(-1);
	}

	// Initialize the clearance value as int and ensure it is proper
	double clear;
	clear = atof(argv[2]);
	if(clear < 0 ){
		printf("\nINPUT ERROR:\tMoon clearance value %0.1f, must be positive\n\n",clear);
		return(-1);
	}

	// Initialize the accuracy tolerance
 	double tol;
	tol = atof(argv[3]);
	if(tol <= 0 ){
		printf("\nINPUT ERROR:\tAccuracy tolerance value must be positive\n\n");
		return(-1);
	}

	// Calls Function to optimize delta V for given objective
	Optimizer(pDv,obj,clear,tol);



	//Updates Initial velocity values for Eulers
	dvx = *pDv;
	dvy = *(pDv+1);
	// dvx = 0;
	// dvy = 80;


	// Calls Eulers 
	int flag = 1;
	Eulers(temp,dvx,dvy,clear,flag,obj,tol);

	// Free Pointer Arrays
	free(temp);
	free(pDv);

	// Return on success
	return 1;
}
