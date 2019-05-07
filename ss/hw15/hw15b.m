% Matt McDade
% System Simulation
% HW 15 Part B

clear; close all; clc;

N = 1000001;
t = linspace(0, 10, N);
T = 0.1;

% Constants
a = 0.1; b = 0.03; c = 0.275;
d = 0.03304; e = 0.00305; m = 1.4017; 

H = 100;
V = m*H;

I = zeros(1, N);
Y = zeros(1, N);

I(1) = 0.1;
Y(1) = 0.1;

for k = 1:N-1
    IL = a .* c .* (V-I(k)) .* (Y(k)/H) - d .* I(k);
    YL = a .* b .* I(k) * ((H-Y(k))/H) - e*Y(k);
    
    IM = I(k) + T*IL;
    YM = Y(k) + T*YL;
    
    IR = a .* c .* (V-IM) .* (YM/H) - d .* IM;
    YR = a .* b .* IM * ((H-YM)/H) - e*YM;
    
    I(k+1) = I(k) + (T/2) * (IL + IR);
    Y(k+1) = Y(k) + (T/2) * (YL + YR);
end

plot(t, Y, t, I)
legend('Infected Humans', 'Mosquito Population')
title('Mosquito Disease Model: Case 2')