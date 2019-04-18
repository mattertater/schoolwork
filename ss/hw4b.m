% Matt McDade
% System Simulation
% HW 4 Problem B

R = 400;
L = 3e-3;
C = 10e-6;

A = [0    -1/L;
     1/C  -1/(R*C) ];
B = [1/L; 
     0 ];
C = [0 1];

T = 1 / (55000 * 100);
tfinal = 0.08;
t = [0:T:tfinal];
N = length(t);

x    = zeros(2, N); 
f    = zeros(2, N);
s    = zeros(1, N);
vout = zeros(1, N);
vin  = 12 * ones(1, N);

for k = 1:N
    if (mod(k, 100) < 40) s(k) = 1;
    else s(k) = 0;
    end
end

for k = 1:N-1
    f(:, k)   = A * x(:, k) + B * s(k) * vin(k);
    x(:, k+1) = x(:, k) + T * f(:, k);
    vout(k+1) = C * x(:, k+1);
end

plot(t, vout);
xlabel('t'); ylabel('Vout')