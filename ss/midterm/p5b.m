% Matt McDade
% System Simulation 
% Midterm Exam Problem 5B

T = 1/4;

t = [0:T:1001];
N = length(t);

xp = zeros(3,N);
xc = zeros(3,N);
f  = zeros(3,N);
fp = zeros(1,N);

% state space system
A = [-4.7 -1.55 -0.55;
    0.3 -2.75 -0.35;
    1.1 1.85 -2.55];
B = [1 0 -1]';
C = [2 1 1];

for k = 1:N-1  
    f(:,k+1) = A*xp(:,k) + B;

    xp(:,k+1) = xc(:,k)+T*((14/11)*f(:,k) - (8/11)) - f(:,k+1) - (16/11)*f(:,k) + (5/11);

    f(:,k+2) = A*xp(:,k+1) + B;
    
    xc(:,k+1) = xp(:,k+1) + T*((70/151)*f(:,k+1) - (44/151)*f(:,k) - (48/151)) - f(:,k+1) - (236/151)*f(:,k) + (85/151);
    
    fp(k+1) = C*xc(:,k+1);
end

plot(t,fp)
title('Simulation with T = 1/4')
