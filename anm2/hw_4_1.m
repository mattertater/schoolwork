% Matt McDade
% ANM 2 
% HW 4 problem 1

function hw_4_1
    close all;
    
    f = @(x, y) (1-20*x*y)./(x.^2);
    f_ex = @(x) (1./(19*x)) - (524288./(19*x.^20));
    a = 2; b = 10; ya = 0;
    
    [T1,Y1] = rk4(f, a, b, ya, 0.01);
    [T2,Y2] = rk4(f, a, b, ya, 0.001);
    [T3,Y3] = rk4(f, a, b, ya, 0.0001);
    
    figure(); plot(T1,Y1,T2,Y2,T3,Y3,T3,f_ex(T3))
    title("RK4 Approx"); legend("h = 0.01","h = 0.001","h = 0.0001","Exact")
    
    relerr1 = relerr(f_ex, T1, Y1);
    relerr2 = relerr(f_ex, T2, Y2);
    relerr3 = relerr(f_ex, T3, Y3);
    figure(); plot(T1, relerr1, ':', T2, relerr2, '--', T3, relerr3, '-.')
    title("RK4 Relative Error"); legend("h = 0.01","h = 0.001","h = 0.0001")
    
    function [t, y] = rk4(f, a, b, ya, h)
        t = a:h:b;
        N = length(t);
        y(a) = ya;
        for i = 1:N-1
            F1 = f(t(i), y(i));
            F2 = f(t(i) + h/2, y(i) + (h/2) * F1);
            F3 = f(t(i) + h/2, y(i) + (h/2) * F2);
            F4 = f(t(i+1), y(i) + h * F3);
            y(i+1) = y(i) + (h/6)*(F1 + 2*F2 + 2*F3 + F4);
        end
    end
    
    function relerr = relerr(f_ex, x, y)
        y_ex = f_ex(x);
        relerr = abs(y_ex - y) ./ (abs(y_ex) + eps);
    end
    
end