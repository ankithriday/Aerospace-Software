% Robert Hakulin
% ASEN 4057 
% Date Created: March 14, 2018
%
% Purpose: Read in text file and plot
% Input: Txt file
% Output: Trajectory plot

clear all; close all; clc;

data = dlmread('Output');
figure()
hold on
plot(data(:,1),data(:,2))
plot(data(:,3),data(:,4))
plot(data(1,5),data(1,6),'ob')