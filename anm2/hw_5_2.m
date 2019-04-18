% Matt McDade
% ANM 2 
% HW 5 Problem 2

function hw_5_2
    close all; clc;
    
    % y1p = y2;
    % y2p = mu * (1 - y1.^2) * y2 - y1;
    % y1_0 = 1; y2_0 = 1;
    mu = 1;
    f = @(t, y) [y(2); mu * (1 - y(1).^2) * y(2) - y(1)];
    
    tspan = [0 20];
    tol = 10^-3;
    options = odeset('AbsTol',tol,'RelTol',tol);
    y0 = [1 1];
    
    z1 = cputime;
    [t1, y1] = ode45(f, tspan, y0, options);
    z2 = cputime;
    fprintf('CPU time: %f seconds. Number of steps: %d\n',z2-z1,length(t1))
    
    z1 = cputime;
    [t2, y2] = ode23s(f, tspan, y0, options);
    z2 = cputime;
    fprintf('CPU time: %f seconds. Number of steps: %d\n',z2-z1,length(t2))
    
    figure(1)
    plot(t1,y1(:,1),t2,y2(:,1))
    title('Solutions for y1(t)')
    legend('ode45','ode23s')    
end