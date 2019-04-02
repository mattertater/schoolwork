% Matt McDade
% System Simulation 
% Midterm Exam Problem 3E

T = [1/4; 1/32];

for i = 1:2
    t = [0:T(i):101];
    N = length(t);

    xp = zeros(3,N);
    f  = zeros(3,N);
    fp = zeros(1,N);

    p = tf([0 T(i)*14/11 T(i)*8/11],[1 -16/11 5/11]);

    % state space system
    A = [-4.7 -1.55 -0.55;
        0.3 -2.75 -0.35;
        1.1 1.85 -2.55];
    B = [1 0 -1]';
    C = [2 1 1];

    for k = 1:N-1  
        f(:,k+1) = A*xp(:,k) + B;

        xp(:,k+1)=xp(:,k)+T(i)*((14/11)*f(:,k) - 8/11) - f(:,k+1) - (16/11)*f(:,k) + (5/11);

        fp(k+1)=C*xp(:,k+1);
    end
    
    figure(i);
    clear title
    plot(t,fp)
    title(['Simulation with T = ', num2str(T(i))])
end
