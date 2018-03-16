#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include"Eulers.h"
#include"ConditionCheck.h"
#define PI 3.14159265358979323846

/*##################################################################################################
#   Robert Hakulin
#   ASEN 4057 Assignment 6
#   Date Created: March 11, 2018
#
#   This C program will run eulers method to integrate the spacecraft trajectory
#
#   Inputs: pointer to outs which handles the output array, dvx,dvy, clearance, a flag for printing,
#           and the objective
#   Outputs: Return 1 if success or -1 if failure
##################################################################################################*/

// Euler function
void Eulers(double *outs,double dvx, double dvy, double clear, int flag, int obj, double tol){

    //Initialize variables
    double ms,rm,re,mm,me,G;
    double clearance;
    double vs,des[2],xs[2],ys[2],vxs[2];
    double vys[2],thetas;
    double vxs0, vys0;
    double vm,dem[2],xm[2],ym[2],vxm[2];
    double vym[2],thetam,dsm[2];
    double xe,ye,vxe,vye;
    double Fmsx[2],Fmsy[2],Fsmx[2],Fsmy[2],Fmex[2],Fesy[2];
    double Fmey[2],Femx[2],Femy[2],Fsex[2],Fsey[2],Fesx[2];
    double stopcond;
    double ts;
    double time;
    int i;
    char *filename = malloc(sizeof(char)*50);


    // Initialize general values for trajectory integration
    mm = 7.34767309e22; me = 5.97219e24; ms = 28833; rm = 1737100; re = 6371000;G = 6.674e-11;
    clearance = rm+clear;

    // Initialize the spacecraft conditions
    thetas = 50;
    vs = 1000;
    des[0] = 338000000;
    xs[0] = des[0] * cos(PI*thetas/180);
    ys[0] = des[0] * sin(PI*thetas/180);
    vxs0 = vs * cos(PI*thetas/180);
    vys0 = vs * sin(PI*thetas/180);
    vxs[0] = vxs0+dvx;
    vys[0] = vys0+dvy;


    // Initialize the moon conditions 
    thetam = 42.5;
    dem[0] = 384403000;
    vm = sqrt(G*pow(me,2)/((me+mm)*dem[0]));
    xm[0] = dem[0] * cos(PI*thetam/180);
    ym[0] = dem[0] * sin(PI*thetam/180);
    vxm[0] = -vm * sin(PI*thetam/180);
    vym[0] = vm * cos(PI*thetam/180);
    dsm[0] = sqrt(pow((xs[0]-xm[0]),2)+pow((ys[0]-ym[0]),2));

    // Initialize Earth IC 
    xe = 0;
    ye = 0;
    vxe = 0;
    vye = 0;

    // Initialize Force IC
    Fmsx[0] = (G*ms*mm*(xm[0]-xs[0]))/pow(dsm[0],3);
    Fmsy[0] = (G*ms*mm*(ym[0]-ys[0]))/pow(dsm[0],3);
    Fsmx[0] = -Fmsx[0]; Fsmy[0] = -Fmsy[0];
    Fmex[0] = (G*me*mm*(xm[0]-xe))/pow(dem[0],3);
    Fmey[0] = (G*me*mm*(ym[0]-ye))/pow(dem[0],3);
    Femx[0] = -Fmex[0]; Femy[0] = -Fmey[0];
    Fsex[0] = (G*me*ms*(xs[0]-xe))/pow(des[0],3);
    Fsey[0] = (G*me*ms*(ys[0]-ye))/pow(des[0],3);
    Fesx[0] = -Fsex[0]; Fesy[0] = -Fsey[0];

    // Initialize Loop conditions
    stopcond = 0;
    ts = 30;
    time = 0;
    i = 1;

    // Opens text file for output
    if (flag ==1){
        char sobj[4]; char sclear[10]; char stol[4]; 
        snprintf(sobj, 4, "%d", obj);
        snprintf(sclear, 10, "%.0f", clear);
        snprintf(stol, 4, "%.1f", tol);
        snprintf(filename,50*sizeof(char),"Output/Optimum_%s_%s_%s",sobj,sclear,stol);
        for (i = 0; filename[i] != '\0';i++){
            if (filename[i] == '.'){
                filename[i] = 'p';
            }
        }
    }

    FILE *fp = fopen(filename,"w");


	// Begin while loop and loops until a stopiing condition is met
	while(stopcond == 0){

        // Update Velocities
        vxs[1] = vxs[0] + ts*(Fmsx[0]+Fesx[0])/ms;
        vys[1] = vys[0] + ts*(Fmsy[0]+Fesy[0])/ms;
        vxm[1] = vxm[0] + ts*(Femx[0]+Fsmx[0])/mm;
        vym[1] = vym[0] + ts*(Femy[0]+Fsmy[0])/mm;

		// Update Positions
        xs[1] = xs[0] + ts*vxs[0];
        ys[1] = ys[0] + ts*vys[0];
        xm[1] = xm[0] + ts*vxm[0];
        ym[1] = ym[0] + ts*vym[0];

		// Update distances between bodies
		dsm[1] = sqrt(pow((xs[1]-xm[1]),2)+pow((ys[1]-ym[1]),2));
        dem[1] = sqrt(pow((xe-xm[1]),2)+pow((ye-ym[1]),2));
        des[1] = sqrt(pow((xs[1]-xe),2)+pow((ys[1]-ye),2));

		// Update Forces
		Fmsx[1] = (G*ms*mm*(xm[1]-xs[1]))/pow(dsm[1],3);
	    Fmsy[1] = (G*ms*mm*(ym[1]-ys[1]))/pow(dsm[1],3);
	    Fsmx[1] = -Fmsx[1]; Fsmy[1] = -Fmsy[1];
	    Fmex[1] = (G*me*mm*(xm[1]-xe))/pow(dem[1],3);
	    Fmey[1] = (G*me*mm*(ym[1]-ye))/pow(dem[1],3);
	    Femx[1] = -Fmex[1]; Femy[1] = -Fmey[1];
	    Fsex[1] = (G*me*ms*(xs[1]-xe))/pow(des[1],3);
	    Fsey[1] = (G*me*ms*(ys[1]-ye))/pow(des[1],3);
	    Fesx[1] = -Fsex[1]; Fesy[1] = -Fsey[1];


        // Checks stopping condition using the created function Condition Check
        stopcond = ConditionCheck(dsm[1], des[1], dem[1], clearance, re, time);


        // Updates the time and cnt
        time = time+ts;
        i++;

        // Shifts all values over 1 to make room for next value
        vxs[0] = vxs[1]; vys[0] = vys[1]; vxm[0] = vxm[1]; vym[0] = vym[1];
        xs[0] = xs[1]; ys[0] = ys[1];
        xm[0] = xm[1]; ym[0] = ym[1];
        dsm[0] = dsm[1]; dem[0] = dem[1]; des[0] = des[1];
        Fmsx[0] = Fmsx[1]; Fmsy[0] = Fmsy[1]; Fsmx[0] = Fsmx[1]; Fsmy[0] = Fsmy[1];
	    Fmex[0] = Fmex[1]; Fmey[0] = Fmex[1]; Femx[0] = Femx[1]; Femy[0] = Femy[1];
	    Fsex[0] = Fsex[1]; Fsey[0] = Fsey[1]; Fesx[0] = Fesx[1]; Fesy[0] = Fesy[1];

        // Prints to file
        if (flag == 1){
            fprintf(fp,"%f %f %f %f %f %f\n",xs[1],ys[1],xm[1],ym[1],xe,ye);
        }
  
    }

	

    // Prints output of final distances

    if (flag == 1){
        fclose(fp); 
        if(stopcond == 1){
            printf("\nIntegration Result:\tThe Spacecraft has hit the Moon\n");
        }
        else if(stopcond == 2){
            printf("\nIntegration Result:\tThe Spacecraft has returned to Earth\n");
        }
        else if(stopcond == 3){
            printf("\nIntegration Result:\tThe Spacecraft has left the 3 Body system\n");
        }
        else if(stopcond == 4){
            printf("\nIntegration Result:\tThe maximum flight time has been achieved\n");
        }
    
    printf("\nFinal Iteration Number is:\t\t%d",i);
    printf("\nTime is:\t\t\t\t%0.3f days",time/(24*3600));
    printf("\nFinal Spacecraft-Earth Distance:\t%0.0f m",des[1]);
    printf("\nFinal Spacecraft-Moon Distance:\t\t%0.0f m",dsm[1]);
    printf("\nFinal Moon-Earth Distance:\t\t%0.0f m\n\n",dem[1]);
    }
    
    // Returns array of outputs
    outs[0] = stopcond;
    outs[1] = time;
    free(filename);	

}
