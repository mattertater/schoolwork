% Matt McDade
% System Simulation
% Final Exam Problem 2C

clear; close all; clc;

tfinal = 400;
T = 0.25;
t = 0:T:tfinal;
N = length(t);

s = 77.27;
w = 0.1610;
q = 8.375E-6;
e = 1;

fA   = zeros(3, N);
fB   = zeros(3, N);
fC   = zeros(3, N);
fSSP = zeros(3, N);
fSSM = zeros(3, N);

A   = zeros(3, N);   A(:,1)   = [1 10000 1000];
B   = zeros(3, N);   B(:,1)   = [31623 10 100000];
C   = zeros(3, N);   C(:,1)   = [1 1 1];
SSP = zeros(3, N);   SSP(:,1) = [500 0.99796 488.68];
SSM = zeros(3, N);   SSM(:,1) = [475 0.99796 488.68];


k = 1;
fA(1,k)   = s * (A(2,k) - A(2,k)*A(1,k) + A(1,k) - q*A(1,k)^2);
fB(1,k)   = s * (B(2,k) - B(2,k)*B(1,k) + B(1,k) - q*B(1,k)^2);
fC(1,k)   = s * (C(2,k) - C(2,k)*C(1,k) + C(1,k) - q*C(1,k)^2);
fSSP(1,k) = s * (SSP(2,k) - SSP(2,k)*SSP(1,k) + SSP(1,k) - q*SSP(1,k)^2);
fSSM(1,k) = s * (SSM(2,k) - SSM(2,k)*SSM(1,k) + SSM(1,k) - q*SSM(1,k)^2);

fA(2,k)   = (1/s) * (-A(2,k) - A(2,k)*A(1,k) + e*A(3,k));
fB(2,k)   = (1/s) * (-B(2,k) - B(2,k)*B(1,k) + e*B(3,k));
fC(2,k)   = (1/s) * (-C(2,k) - C(2,k)*C(1,k) + e*C(3,k));
fSSP(2,k) = (1/s) * (-SSP(2,k) - SSP(2,k)*SSP(1,k) + e*SSP(3,k));
fSSM(2,k) = (1/s) * (-SSM(2,k) - SSM(2,k)*SSM(1,k) + e*SSM(3,k));

fA(3,k)   = w * (A(1,k) - A(3,k));
fB(3,k)   = w * (B(1,k) - B(3,k));
fC(3,k)   = w * (C(1,k) - C(3,k));
fSSP(3,k) = w * (SSP(1,k) - SSP(3,k));
fSSM(3,k) = w * (SSM(1,k) - SSM(3,k));

A(:,2)   = A(:,1) + T*fA(:,k);
B(:,2)   = B(:,1) + T*fB(:,k);
C(:,2)   = B(:,1) + T*fC(:,k);
SSP(:,2) = SSP(:,1) + T*SSP(:,k);
SSM(:,2) = SSM(:,1) + T*SSM(:,k);

for k = 2:N-1
    fA(1,k)   = s * (A(2,k) - A(2,k)*A(1,k) + A(1,k) - q*A(1,k)^2);
    fB(1,k)   = s * (B(2,k) - B(2,k)*B(1,k) + B(1,k) - q*B(1,k)^2);
    fC(1,k)   = s * (C(2,k) - C(2,k)*C(1,k) + C(1,k) - q*C(1,k)^2);
    fSSP(1,k) = s * (SSP(2,k) - SSP(2,k)*SSP(1,k) + SSP(1,k) - q*SSP(1,k)^2);
    fSSM(1,k) = s * (SSM(2,k) - SSM(2,k)*SSM(1,k) + SSM(1,k) - q*SSM(1,k)^2);
    
    fA(2,k)   = (1/s) * (-A(2,k) - A(2,k)*A(1,k) + e*A(3,k));
    fB(2,k)   = (1/s) * (-B(2,k) - B(2,k)*B(1,k) + e*B(3,k));
    fC(2,k)   = (1/s) * (-C(2,k) - C(2,k)*C(1,k) + e*C(3,k));
    fSSP(2,k) = (1/s) * (-SSP(2,k) - SSP(2,k)*SSP(1,k) + e*SSP(3,k));
    fSSM(2,k) = (1/s) * (-SSM(2,k) - SSM(2,k)*SSM(1,k) + e*SSM(3,k));

    fA(3,k)   = w * (A(1,k) - A(3,k));
    fB(3,k)   = w * (B(1,k) - B(3,k));
    fC(3,k)   = w * (C(1,k) - C(3,k));
    fSSP(3,k) = w * (SSP(1,k) - SSP(3,k));
    fSSM(3,k) = w * (SSM(1,k) - SSM(3,k));
    
    a1=-1;
    a0=0;
    b1=3/2;
    b0=1/2;
    
    A(:,k+1)   = T*(3/2)*fA(:,k) + T*(1/2)*fA(:,k-1) + A(:,k);
    B(:,k+1)   = T*(3/2)*fB(:,k) + T*(1/2)*fB(:,k-1) + B(:,k);
    C(:,k+1)   = T*(3/2)*fC(:,k) + T*(1/2)*fC(:,k-1) + C(:,k);
    SSP(:,k+1) = T*(3/2)*fSSP(:,k) + T*(1/2)*fSSP(:,k-1) + SSP(:,k);
    SSM(:,k+1) = T*(3/2)*fSSM(:,k) + T*(1/2)*fSSM(:,k-1) + SSM(:,k);
end

% Part 1
figure(1)
subplot(311)
plot(t, log10(C(1,:)))
xlabel('t')
ylabel('x1')
title('x1 vs T (C initial condition)')

subplot(312)
plot(t, log10(C(2,:)))
xlabel('t')
ylabel('x2')
title('x2 vs T (C initial condition)')

subplot(313)
plot(t, log10(C(3,:)))
xlabel('t')
ylabel('x3')
title('x3 vs T (C initial condition)')

% Part 2
figure(2)
hold on
plot(log10(A(2,:)), log10(A(1,:)))
plot(log10(B(2,:)), log10(B(1,:)))
plot(log10(C(2,:)), log10(C(1,:)))
plot(log10(SSP(2,:)), log10(SSP(1,:)))
plot(log10(SSM(2,:)), log10(SSM(1,:)))
hold off
legend('A', 'B', 'C', 'SS+', 'SS-')
xlabel('log(x2)')
ylabel('log(x1)')
title('log(x2) vs log(x1)')
axis([-1 20 -1 20])

% Part 3
figure(3)
hold on
plot(log10(A(2,:)), log10(A(3,:)))
plot(log10(B(2,:)), log10(B(3,:)))
plot(log10(C(2,:)), log10(C(3,:)))
plot(log10(SSP(2,:)), log10(SSP(3,:)))
plot(log10(SSM(2,:)), log10(SSM(3,:)))
hold off
legend('A', 'B', 'C', 'SS+', 'SS-')
xlabel('log(x2)')
ylabel('log(x3)')
title('log(x2) vs log(x3)')
axis([-1 20 -1 20])