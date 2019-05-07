% Matt McDade
% System Simulation
% HW 4 Problem A

R = 400;
L = 3e-3;
C = 10e-6;

A = [0 -1/L; 1/C -1/(R*C)];
B = [1/L; 0];
C = [0 1];

[num1, den1] = ss2tf(A, 0.4*B, C, 0);
[num2, den2] = ss2tf(A, 12*B, C, 0);
disp('Vout(s) / Vin(s) =')
disp(num1); disp(den1)

disp('Vout(s) / S(s) =')
disp(num2); disp(den2)