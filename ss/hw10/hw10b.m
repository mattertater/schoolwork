% Matt McDade
% System Simulation
% HW 10 Part B

close all; clc; clear;
Omega = linspace(0, 2*pi, 10001);
s = exp(1i*Omega);
T = 0.001;
G = (0.0850) ./ (s.^4+0.4174*s.^3+1.0871*s.^2+0.2805*s+0.1512);

figure(1)
subplot(211)
plot(Omega, abs(G));
title('Magnitude')

subplot(212)
plot(Omega, angle(G));
title('Angle')