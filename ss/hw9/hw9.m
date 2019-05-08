% Matt McDade
% System Simulation
% Homework 9

clear; close all; clc;

N_theta = 20;
theta = linspace(0, 2*pi, 1001);
V_theta = linspace(0, 2*pi, N_theta);
N_rho = 10;
rho = linspace(0, 1, 1001);
V_rho = linspace(0, 1, N_rho);

a0 = 17/6; a1 = 13/3;  a2 = -49/6;
b0 = 7/3;  b1 = -34/3; b2 = 0;

for k = 1:length(V_rho)
    z = V_rho(N_rho+1-k) * exp(theta*1i);
    Z = (z.^3 + a2*z.^2 + a1*z + a0) ./ (b2*z.^2 + b1*z + b0);
    hold on
    plot(real(Z), imag(Z))
    hold off
end

for k = 1:length(V_theta)-1
    z = rho*exp(V_theta(k)*1i);
    Z = (z.^3 + a2*z.^2 + a1*z + a0) ./ (b2*z.^2 + b1*z + b0);
    hold on
    plot(real(Z), imag(Z))
    hold off
end

axis([-2 2 -2 2])
axis square