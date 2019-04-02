% Matt McDade
% ANM 2
% Exam 1 Problem 1

function p1
    clc; close all;
    
    f = @(t, y) t*(exp(-1000*t)) - 10 * y
    
    tspan = [0 0.5];
    tol = 1e-9;
    y0 = 0;
    options = odeset('AbsTol', tol, 'RelTol', tol);
    
    disp('Using ode23s: This is a stiff problem since the time scale changes as to how often things happen, so stiff solver works best')
    z1 = cputime;
    [t,y] = ode23s(f,tspan,y0,options);
    z2 = cputime;
    fprintf('CPU time: %f seconds.  Number of steps: %d\n',z2-z1,length(t))

    figure(1)
    plot(t, y),legend('ode23s')
end