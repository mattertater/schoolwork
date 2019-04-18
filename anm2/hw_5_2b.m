% Matt McDade
% ANM 2 
% HW 5 Problem 2

function hw_5_2b
    close all; clc;
    
    mu = 1000;
    f = @(t, y) [y(2); mu * (1 - y(1).^2) * y(2) - y(1)];
    
    tspan = [0 3000];
    tol = 10^-3;
    options = odeset('AbsTol',tol,'RelTol',tol);
    y0 = [1 1];
    
    z1 = cputime;
    [t1, y1] = ode23s(f, tspan, y0, options);
    z2 = cputime;
    fprintf('CPU time: %f seconds. Number of steps: %d\n',z2-z1,length(t1))
    
    figure(1)
    plot(t1,y1(:,1))
    title('Solutions for y1(t)')
    legend('ode23s')    
end