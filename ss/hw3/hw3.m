% Matt McDade
% System Simulation HW 3
% Graphs are certainly wrong but I think I'm close
close all;

T = 0.001;
x = 0:T:100;
N = length(x);

step = ones(1, N);
u_a = 12 * step;
u_b = 0.4 * step;

y_a = zeros(1, N);
y_b = zeros(1, N);

b2_a = (4/3) * 10^7 * T^2;
a1_a = -2-250*T;
a0_a = 1;

b2_b = 4 * 10^8 * T^2;
a1_b = -2-250*T;
a0_b = 1;

for k = 3:N
    y_a(k) = -a1_a * y_a(k-1) - a0_a * y_a(k-2) + b2_a * u_a(k);
    y_b(k) = -a1_b * y_b(k-1) - a0_b * y_b(k-2) + b2_b * u_b(k);
end

figure(); plot(x, y_a)
xlabel('T'); ylabel('y')

figure(); plot(x, y_b)
xlabel('T'); ylabel('y')