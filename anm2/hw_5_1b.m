% Matt McDade
% ANM 2 
% HW 5 Problem 1b

function hw_5_1b
    close all; clc;
    
    a = 0.5; b = 10^-5; 
    
    k = [0; 100; 200; 300; 400; 490];
    % for i = 1:numel(alphaVals)
    
    Pp = @(t, P) a*P - b*P.^2 - k;
    
    P0 = 1000;
    tspan = [0 100];
    tol = 1e-6;
    options = odeset('AbsTol',tol,'RelTol',tol);
    for i = 1:numel(k)
        clear title
        figure(i)
        Pp = @(t, P) a*P - b*P.^2 - k(i);
        [T, M] = ode45(Pp, tspan, P0, options);
        plot(T, M)
        title(['k = ', num2str(k(i))])
    end
    
    % I made a loop that simulated the population for different values of
    % k, only accepting cases where the population either never reached
    % 5000 (the max), or went negative. There was only 1 k value that
    % prevailed and that was 490
    
    % At k = 490, the population no longer goes up or down. 
    % One less at k = 489, the poplation rises and stays at the maximum of
    % 5000. One more at k = 490, and the population dips into the
    % negatives. 490 is perfect though
end