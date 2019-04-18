% Matt McDade
% ANM 2 
% HW 5 Problem 1a

function hw_5_1a
    close all; clc;
    
    a = 0.5; b = 10^-5; 
    
    k = 0;
    Pp = @(t, P) a*P - b*P.^2 - k;
    
    P0 = 1000;
    tspan = [0 100];
    tol = 1e-6;
    options = odeset('AbsTol',tol,'RelTol',tol);
    
    [T1, M1] = ode45(Pp, tspan, P0, options);
    
    figure(1)
    plot(T1, M1)
end