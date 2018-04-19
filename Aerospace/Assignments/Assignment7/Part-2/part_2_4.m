%% Ankit Hriday
%% Assignment-7 2.3
%% April-17 2018
clear all; close all; clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Read and Calculate
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen('heat_solution_2_1','r');
formatSpec = '%f %f %f';
sizeA = [3 Inf];
A = fscanf(fileID, formatSpec, sizeA);
A = A';
num_rows = size(A,1);
x_array = A(1:num_rows,1);
y_array = A(1:num_rows,2);
T_array = A(1:num_rows,3);

for i = 1:length(T_array)
    if x_array(i) > 0.01 && x_array(i) < 0.015 && y_array(i) > 0.01 && y_array(i) < 0.015
            k(i) = 167;
    else k(i) = 157;
    end
end
fclose(fileID);

del_T = diff(T_array);

q = -k(1:end-1).*del_T';
Q = sum(q)