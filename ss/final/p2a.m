% Matt McDade
% System Simulation 
% Final Exam Problem 2A

clear; close all; clc;

s = 77.27;
w = 0.1610;
q = 8.375E-6;
e = 1;

x1 = 488.68;
x2 = 0.99796;
x3 = 488.68;

f1 = s * (x2 - (x2*x1) + x1 - q*(x1^2))
f2 = (-x2 - (x2*x1) + (e*x3)) / s
f3 = w * (x1 - x3)

disp('Values are very close to 0, so this is close to an equilibrium point')