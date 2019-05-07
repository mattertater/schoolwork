% Matt McDade
% System Simulation
% Final Exam Problem 3

% Don't clear variables so we can plot all cities at the same time
close all; clc;

N = 500;
T = 0.5;
t = linspace(1, N, N);

a = 0.005;  % Rate of defeat of zombies
b = 0.0055; % Bite rate of the zombies
z = 0.5;    % Raising rate from the removed class
d = 0.001;  % Death rate due to non-zombie causes
r = 0.5;    % Rate of infected individuals zombie-fying
c = 0.002;  % Rate of curing zombies
p = 0.001;  % Birth rate in humans

Akron = 197.859;
Canal_Fulton = 5.479;
Cleveland = 389.521;
Columbus = 835.957;

S = zeros(1, N); S(1) = Columbus;   % Succeptable Humans
I = zeros(1, N); I(1) = 0;          % Infected
Z = zeros(1, N); Z(1) = 0;          % Zombies
R = zeros(1, N); R(1) = 0;          % Removed (can be zombie-fyed)

% Simulate using RK4
for k = 1:N-1
    SK1 = p*S(k) - b*Z(k)*S(k) - d*S(k) + c*Z(k);
    IK1 = b*Z(k) * S(k) - r*I(k) - d*I(k);
    ZK1= r*I(k) + z*R(k) - a*S(k)*Z(k) - c*Z(k);
    RK1 = d*S(k) - z*R(k);

    MS1 = S(k) + (T/2)*SK1;
    MI1 = I(k) + (T/2)*IK1;
    MZ1 = Z(k) + (T/2)*ZK1;
    MR1 = R(k) + (T/2)*RK1;  

    SK2 = p*MS1 - b*MZ1*MS1 - d*MS1 + c*MZ1;
    IK2 = b*MZ1*MS1 - r*MI1 - d*MI1;
    ZK2 = r*MI1 + z*MR1 - a*MS1*MZ1 - c*MZ1;
    RK2 = d*MS1 - z*MR1;

    MS2 = S(k) + (T/2)*SK2;
    MI2 = I(k) + (T/2)*IK2;
    MZ2 = Z(k) + (T/2)*ZK2;
    MR2 = R(k) + (T/2)*RK2;  

    SK3 = p*MS2 - b*MZ2*MS2 - d*MS2 + c*MZ2;
    IK3 = b*MZ2*MS2 - r*MI2 - d*MI2;
    ZK3 = r*MI2 + z*MR2 - a*MS2*MZ2 - c*MZ2;
    RK3 = d*MS2 - z*MR2;

    MS3 = S(k) + (T)*SK3;
    MI3 = I(k) + (T)*IK3;
    MZ3 = Z(k) + (T)*ZK3;
    MR3 = R(k) + (T)*RK3;    

    SK4 = p*MS3 - b*MZ3*MS3 - d*MS3 + c*MZ3;
    IK4 = b*MZ3*MS3 - r*MI3 - d*MI3;
    ZK4 = r*MI3 + z*MR3 - a*MS3*MZ3 - c*MZ3;
    RK4 = d*MS3 - z*MR3;

    S(k+1) = S(k) + (T/6)*(SK1 + 2*SK2 + 2*SK3 + SK4);
    I(k+1) = I(k) + (T/6)*(IK1 + 2*IK2 + 2*IK3 + IK4);
    Z(k+1) = Z(k) + (T/6)*(ZK1 + 2*ZK2 + 2*ZK3 + ZK4);
    R(k+1) = R(k) + (T/6)*(RK1 + 2*RK2 + 2*RK3 + RK4);
end

H_Columbus = S;
Z_Columbus = Z;

figure(1)
plot(t, S, t, I, t, Z, t, R)
legend('Humans','Infected','Zobmies','Dead (Raise-able)')
xlabel('Days')
ylabel('Population (Thousands)')
title('Columbus')

figure(2)
plot(t, Z_Akron, t, Z_Canal_Fulton, t, Z_Cleveland, t, Z_Columbus)
legend('Akron', 'Canal Fulton', 'Cleveland', 'Columubus')
xlabel('Days')
ylabel('Population (Thousands)')
title('Zombies')

