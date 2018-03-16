#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include"ConditionCheck.h"

/*##################################################################################################
#	Robert Hakulin
# 	ASEN 4057 Assignment 6
# 	Date Created: March 11, 2018
#
# 	This C program will check the stopping conditions
#
# 	Inputs: Distance between the three bodies
# 	Outputs: Boolean if stopping condition is met
##################################################################################################*/

int ConditionCheck(double DSM, double DES, double DEM, double clearance, double re, double time){
	int stopcond;
	if (DSM <= clearance){
		stopcond = 1;
		return(stopcond);
	}
	else if (DES <= re){
		stopcond = 2;
		return(stopcond);
	}
	else if (DES >= 2*DEM){
		stopcond = 3;
		return(stopcond);
	}
	else if (time >= 12*24*3600){
		stopcond = 4;
		return(stopcond);
	}
	else{
		stopcond = 0;
		return(stopcond);
	}
}