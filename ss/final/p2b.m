% Matt McDade
% System Simulation 
% Final Exam Problem 2B

clear; close all; clc;

s = 77.27;
w = 0.1610;
q = 8.375E-6;
e = 1;

x1 = 1;
x2 = 10000;
x3 = 1000;
A = [s*(-x2 + 1 - 2*q*x1), s*(1-x1), 0;
    -x2/s, (-1-x1)/s, e/s;
    w, 0, -w];
eigA = eig(A)
srA = max(abs(eigA)) / min(abs(eigA))

x1 = 31623;
x2 = 10;
x3 = 100000;
B = [s*(-x2 + 1 - 2*q*x1), s*(1-x1), 0;
    -x2/s, (-1-x1)/s, e/s;
    w, 0, -w];
eigB = eig(B)
srB = max(abs(eigB)) / min(abs(eigB))

x1 = 1;
x2 = 1;
x3 = 1;
C = [s*(-x2 + 1 - 2*q*x1), s*(1-x1), 0;
    -x2/s, (-1-x1)/s, e/s;
    w, 0, -w];
eigC = eig(C)
srC = max(abs(eigC)) / min(abs(eigC))

x1 = 488.68;
x2 = 0.99796;
x3 = 488.68;
Eq = [s*(-x2 + 1 - 2*q*x1), s*(1-x1), 0;
    -x2/s, (-1-x1)/s, e/s;
    w, 0, -w];
eigEq = eig(Eq)
srEq = (max(abs(eigEq))) / (min(abs(eigEq)))