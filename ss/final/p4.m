% Matt McDade
% System Simulation
% Final Exam Problem 4

% I think I'm doing RK4 right, but not plugging in the equations correctly.

N = 1000;
T = 0.1;
t = linspace(0, N, N);

a = 0.5;
b = -5.6;

x = zeros(1, N);
R = zeros(1, N);
H = zeros(1, N); 

for k = 1:4
    R(k) = 0.1;
    H(k) = 0.1;
end

for k = 4:N-1
    RK1 = -a*R(k-1) - b*(1 - R(k-3)^2)*R(k-2) - R(k-3);
    HK1 = (-R(k) - a*R(k-1) - R(k-3)) / (b*(1-R(k-3)^2));

    MR1 = R(k) + (T/2)*RK1;
    MH1 = H(k) + (T/2)*HK1;
 
    RK2 = -a*MR1 - b*(1 - R(k-3)^2)*R(k-2) - R(k-3);
    HK2 = (-R(k) - a*MH1 - R(k-3)) / (b*(1-R(k-3)^2));

    MR2 = R(k) + (T/2)*RK2;
    MH2 = H(k) + (T/2)*HK2;
 
    RK3 = -a*MR2 - b*(1 - R(k-3)^2)*R(k-2) - R(k-3);
    HK3 = (-R(k) - a*MH2 - R(k-3)) / (b*(1-R(k-3)^2));

    MR3 = R(k) + (T)*RK3;
    MH3 = H(k) + (T)*HK3;   

    RK4 = -a*MR3 - b*(1 - R(k-3)^2)*R(k-2) - R(k-3);
    HK4 = (-R(k) - a*MH3 - R(k-3)) / (b*(1-R(k-3)^2));

    R(k+1) = R(k) + (T/6)*(RK1 + 2*RK2 + 2*RK3 + RK4);
    H(k+1) = H(k) + (T/6)*(HK1 + 2*HK2 + 2*HK3 + HK4);

end

figure(1)
plot(t, R, t, H)
legend('R', 'H')
title('R vs t & H vs T')

figure(2)
plot(R, H)
title('H vs R')