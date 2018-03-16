#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include"Eulers.h"
#include"ConditionCheck.h"
#include"Optimizer.h"
#define PI 3.14159265358979323846

/*##################################################################################################
#   Robert Hakulin
#   ASEN 4057 Assignment 6
#   Date Created: March 11, 2018
#
#   This C program will optimize either part 1 or 2 depending on the input of user
#
#   Inputs: Output pointer to array, objective, clearance, and tolerance to solve DVX,DVY
#   Outputs: optimal deltav pointer
##################################################################################################*/

// Function that optimizes DV
void Optimizer(double *pVal, int obj, double clear, double tol){

	// Initialize the output array of functions
	double minDV[2];
	double minTime[2];
	double stopcond;
	double DV[2];
	double DVtot;
	int flag;
	double time;
	double *outs = malloc(2*sizeof(double));

	// Initialize DV
	flag = 0; 
	DV[0] = 1000;

	printf("\nSolving for Objective %d...\n",obj);

	// Solves if objective is 2
	if (obj == 1){
		// Loops through dvx values with course resolution
		printf("\nGrid searching all values with course resolution...\n");
		for(int i=-100;i<=100;i=i+2){
			//Loops through dvy with course values
			for(int j=-100;j<=100;j=j+2){
				Eulers(outs,i,j,clear,flag,obj,tol);
				stopcond = (int)*outs;
				if(stopcond == 2){
					DV[1] = sqrt(pow(i,2)+pow(j,2));
					if(DV[1]<=DV[0]){
						minDV[0] = i;
						minDV[1] = j;
						DV[0]=DV[1];
					}

				}
			}
		}

		printf("\nInitial Guess for objective %d:\tDVX = %0.3f m/s\n\t\t\t\tDVY = %0.3f m/s\n", obj,minDV[0],minDV[1]);
		printf("\nSearching with fine resolution near initial guess...\n\n");
		// Initialize DV again
		DV[0] = 1000;

		// Ensures guess does not exceed bounds
		if(minDV[0] <= -95){
			minDV[0] = -95;
		}
		else if(minDV[0] >= 95){
			minDV[0] = 95;
		}
		if(minDV[1] <= -95){
			minDV[1] = -95;
		}
		else if(minDV[1] >= 95){
			minDV[1] = 95;
		}

		// Loop through with fine resolution
		for(float i=minDV[0]-3;i<=minDV[0]+3;i=i+tol){
			//Loops through dvy
			for(float j=minDV[1]-3;j<=minDV[1]+3;j=j+tol){
				Eulers(outs,i,j,clear,flag,obj,tol);
				stopcond = (int)*outs;
				if(stopcond == 2){
					DV[1] = sqrt(pow(i,2)+pow(j,2));
					if(DV[1]<=DV[0]){
						minDV[0] = i;
						minDV[1] = j;
						DV[0]=DV[1];
					}

				}
			}
		}
	}

	// Solves if objective is 2
	else if (obj == 2){

		// Initializes minTime
		minTime[0] = 12*24*3600;

		// Loops through dvx values with course resolution
		printf("\nGrid searching all values with course resolution...\n");
		for(int i=-100;i<=100;i=i+2){
			//Loops through dvy with course values
			for(int j=-100;j<=100;j=j+2){
				DVtot = sqrt(pow(i,2)+pow(j,2));
				Eulers(outs,i,j,clear,flag,obj,tol);
				stopcond = (int)*outs;
				time = *(outs+1);
				if(stopcond == 2 && DVtot <= 100){
					minTime[1] = time;
					if(minTime[1]<=minTime[0]){
						minDV[0] = i;
						minDV[1] = j;
						minTime[0]=minTime[1];
					}

				}
			}
		}

		printf("\nInitial guess:\t\tDVX = %0.3f m/s\n\t\t\tDVY = %0.3f m/s\n",minDV[0],minDV[1]);
		printf("\nSearching with fine resolution near initial guess...\n\n");
		// Initialize minTime again
		minTime[0] = 12*24*3600;

		// Ensures guess does not exceed bounds
		if(minDV[0] <= -95){
			minDV[0] = -95;
		}
		else if(minDV[0] >= 95){
			minDV[0] = 95;
		}
		if(minDV[1] <= -95){
			minDV[1] = -95;
		}
		else if(minDV[1] >= 95){
			minDV[1] = 95;
		}


		// Loop through with fine resolution
		for(float i=minDV[0]-3;i<=minDV[0]+3;i=i+tol){
			//Loops through dvy
			for(float j=minDV[1]-3;j<=minDV[1]+3;j=j+tol){
				DVtot = sqrt(pow(i,2)+pow(j,2));
				Eulers(outs,i,j,clear,flag,obj,tol);
				stopcond = (int)*outs;
				time = *(outs+1);
				if(stopcond == 2 && DVtot <= 100){
					minTime[1] = time;
					if(minTime[1]<=minTime[0]){
						minDV[0] = i;
						minDV[1] = j;
						minTime[0]=minTime[1];
					}

				}
			}
		}

	}

	// Assigns output array values
	pVal[0] = minDV[0]; pVal[1] = minDV[1];

	// Prints results
	printf("Final values for objective %d:\tDVX = %0.3f m/s\n\t\t\t\tDVY = %0.3f m/s\n\n",obj, *pVal,*(pVal+1));
	if (obj == 1){ 
		printf("The minimum delta V to return to Earth is %0.3f m/s\n\n",DV[0]);
	}
	else if (obj == 2){
		printf("The minimum time to return to Earth is %0.3f days\n",time/(24*3600));
		printf("The minimum delta V = %0.3f m/s\n\n",sqrt(pow(minDV[0],2)+pow(minDV[1],2)));
	}	

	// Free variables
	free(outs); 	


}

