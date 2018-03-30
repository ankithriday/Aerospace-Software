%% Ankit Hriday
%% March-28, 2018
%% Main Script 
%% Housekeeping
clear all; close all; clc

%% Set Initial Conditions
theta1 =  1.5;
theta2 =  3;
thetadot_1 = 0; 
thetadot_2 = 0;

% Convert degress to radians
theta1 = deg2rad(theta1);
theta2 = deg2rad(theta2);
 
%IC
tspan = [0 10];
y0 = [theta1 thetadot_1 theta2 thetadot_2];

%% Call ode45
%[t,y] = simulate_pendulum(tspan,y0,l1,l2,m1,m2)
[t,y] = simulate_pendulum(tspan,y0,1,2,1,2)
plot(t,y(:,1))