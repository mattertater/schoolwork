% Matt McDade
% System Simluation
% Final Exam Problem 5B

clear; close all; clc;

N = 100;
t = linspace(0, N, N);

a1 = 0.1;
a2 = 0.3;

A1 = 1.2;
% A2 Moved to end of file
R1 = @(x) (exp(x)-exp(-x)) / (exp(x)+exp(-x));
R2 = @(x) (2*exp(x)-2*exp(-x)) / (exp(x)+2*exp(-x));

x1 = zeros(1, N);
x2 = zeros(1, N);
fx1 = zeros(1, N);
fx2 = zeros(1, N);

for k = 2:N-1
    fx1(k) = -a1 * x1(k) + R1(x2(k)) + A2(k);
    fx2(k) = -a2 * x2(k) + R2(x1(k)) + A1;
    
    x1(k+1) = x1(k) + (3/2) * fx1(k) - (1/2) * fx1(k-1);
    x2(k+1) = x2(k) + (3/2) * fx2(k) - (1/2) * fx2(k-1);
end

plot(t, x1, t, x2)
title('Problem 5B - Feelings Over Time')
legend("Belle's Feelings", "The Beast's Feelings")

function a = A2(t)
    a = 0;
    if (t>=0 & t<=35)
        a = 0.02*t - 1.9;
    elseif t>35
        a = -1;
    end
end