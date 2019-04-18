% Matt McDade
% ANM 2 
% HW 4 problem 3

function hw_4_3
    close all; clc;
    
    K1 = 0.1233; K2 = 0.00532; t0 = 3689.21;
    Jin = @(t) K1 * exp(-K2 * (t - t0));
    
    lambda = 0.0059; 
    Mp = @(t, M) Jin(t) - lambda * M;
    
    M0 = 400;
    tspan = [4000 8000];
    tol = 1e-6;
    options = odeset('AbsTol',tol,'RelTol',tol);
    
    [T1, M1] = ode45(Mp, tspan, M0, options);
    
    lambda = 0.00059; 
    Mp = @(t, M) Jin(t) - lambda * M;
    [T2, M2] = ode45(Mp, tspan, M0, options);
    
    figure(1)
    plot(T1, M1, T2, M2)
    legend('lambda = 0.0059', 'lambda = 0.00059')
    xlabel("Days")
    ylabel("Mass of contaminants (kg)")
end