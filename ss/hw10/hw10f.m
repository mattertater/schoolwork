% Matt McDade
% System Simulation
% Homework 10 Part F

N = 10000;
t = linspace(0, 10, N);

[A, B, C, D] = tf2ss([0.085],[1 0.4174 1.0871 0.2805 0.1512])

T_rel_stable = 0.5;
T_com_stable = 0.01;
T_rel_unstable = 0.7;
T_com_unstable = 1;

x1 = zeros(1, N);
x2 = zeros(1, N);
x3 = zeros(1, N);
x4 = zeros(1, N);
fx1 = zeros(1, N);
fx2 = zeros(1, N);
fx3 = zeros(1, N);
fx4 = zeros(1, N);
y = zeros(1, N);

for k = 1:N-2
    fx1(k+1) = -0.4174*x1(k) - 1.0871*x2(k) - 0.2805*x3(k) - 0.1512*x4(k);
    fx2(k+1) = 
end

