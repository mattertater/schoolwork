% Matt McDade
% System Simulation
% Homework 11A

R1 = 500
R2 = 1E3;
R3 = 1E3;
C1 = 4.7E-6;
C2 = C1;
C3 = C1;
L = 2;

A = [-1/(R2*C1) 1/(R2*C1) 0 1/C1;
    1/(R2*C2) -(1/(R2*C2) + 1/(R3*C2)) 1/(R3*C2) 0;
    0 1/(R3*C3) -1/(R3*C3) 0;
    -1/L 0 0 -R1/L];
eigA = eig(A)