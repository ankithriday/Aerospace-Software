% Robert Hakulin
% ASEN 4057 
% Date Created: March 14, 2018
%
% Purpose: Read in text file and plot
% Input: Txt file
% Output: Trajectory plot

clear all; close all; clc;

opt = 'Optimum';
obj = '2';
clearance = '10000';
tol = '0p5';
file = strcat(opt,'_',obj,'_',clearance,'_',tol);
y = dlmread(file);
figure()
hold on
dsm = sqrt((y(:,1)-y(:,3)).^2+(y(:,2)-y(:,4)).^2);
ind = find(dsm == min(dsm));

xlabel('X Position (m)','Fontsize',14)
ylabel('Y Position (m)','Fontsize',14)
title(strcat(opt,'{ }',obj,'{ }',clearance,'{ }',tol),'Fontsize',14)
plot(y(1,5),y(1,6),'ob','Markersize',10)
plot(y(ind,3),y(ind,4),'-ok','Markersize',6)
plot(y(ind,1),y(ind,2),'-om','Markersize',4)
plot(y(1,1),y(1,2),'xg','Markersize',10)
plot(y(end,1),y(end,2),'xr','Markersize',10)
legend('Earth','Moon','Spacecraft','Start','End' )
plot(y(:,3),y(:,4),'--k','Markersize',10)
plot(y(:,1),y(:,2),'--m','Markersize',10)
axis ([-1e8 4e8 -1e8 4.5e8])