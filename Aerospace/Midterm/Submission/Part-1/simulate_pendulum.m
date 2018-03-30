%% Ankit Hriday
%% Asen 4057 Midterm (Take Home)
%% Function to call ode45 and 
% provide inputs of l1,l2,m1,m2

function [t,y] = simulate_pendulum(tspan,y0,l1,l2,m1,m2)
y0(5:8) = [l1,l2,m1,m2];
[t,y] = ode45('pendulum',tspan,y0);
end