% Matt McDade
% System Simulation
% HW 6

close all; clc; clear;

T = 100E-6;
tfinal = 500;
t = [0:T:tfinal];
N = length(t);
a = 0.2;
b = 0.2;
c = 4.1;

x(1) = 4; y(1) = 2; z(1) = 10;

k = 1;
f_x(k) = -y(k) - z(k);
f_y(k) = x(k) + a*y(k);
f_z(k) = b + z(k) * (x(k) - c);

x(k+1) = x(k) + T * f_x(k);
y(k+1) = y(k) + T * f_y(k);
z(k+1) = z(k) + T * f_z(k);

for k = 2:N-1
    f_x(k) = -y(k) - z(k);
    f_y(k) = x(k) + a*y(k);
    f_z(k) = b + z(k) * (x(k) - c);
    
    x(k+1) = x(k) + (3/2) * T * f_x(k) - (1/2) * T * f_x(k-1);
    y(k+1) = y(k) + (3/2) * T * f_y(k) - (1/2) * T * f_y(k-1);
    z(k+1) = z(k) + (3/2) * T * f_z(k) - (1/2) * T * f_z(k-1);
end

plot(x, y)
title('a=b=0.2, c=4.1  x(1)=4, y(1)=2')