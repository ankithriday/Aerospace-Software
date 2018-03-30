%% Ankit Hriday
%% Asen 4057 Midterm (Take Home)
%% ODE function
function dydt = pendulum(t,y0)
%% Constants and Variables 
g = 9.81;
theta1 = y0(1);
thetadot_1 = y0(2);
theta2 = y0(3);
thetadot_2 = y0(4);
l1 = y0(5);
l2 = y0(6);
m1 = y0(7);
m2 = y0(8);

%% All of the changes dydt recorded from the equations
% Change in theta1
dydt(1) = thetadot_1;
% Change in theta_dot1
dydt(2) = -((g*(2*m1+m2)*sin(theta1)+m2*(g*sin(theta1-2*theta2)+2*(l2*thetadot_2^2+...
    l1*thetadot_1^2*cos(theta1-theta2))*sin(theta1-theta2)))/...
    (2*l1*(m1+m2-m2*cos(theta1-theta2)^2)));
% Change in theta2
dydt(3) = thetadot_2;

% Change in theta_dot2
dydt(4) = (((m1+m2)*(l1*thetadot_1^2+g*cos(theta1))+l2*m2*thetadot_2^2*cos(theta1-theta2))*...
    sin(theta1-theta2))/(l2*(m1+m2-m2*cos(theta1-theta2)^2));

%No change in constant
dydt(5) = 0;
dydt(6) = 0;
dydt(7) = 0;
dydt(8) = 0;
dydt = dydt';
end