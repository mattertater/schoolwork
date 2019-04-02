% Matt McDade
% ANM 2 
% HW 3 problem 3

function hw_3_3
    close all;
    
    f_ex = @(x) (1./(19*x)) - (524288./(19*x.^20));
    
    % h = 0.01
    a = 2; b = 10; h = 0.01; ya = 0; 
    T1 = a:h:b; N1 = length(T1);
    y1 = zeros(1,N1); y2(a) = ya;
    
   
    for j=1:N1-1
       f = (1-20*T1(j)*y1(j))/(T1(j)^2);
       fx = (20*T1(j)*y1(j)-2)/(T1(j)^3);
       fxx = (6-40*T1(j)*y1(j))/T1(j)^4;
       fy = -20/T1(j);
       fxy = 20/(T1(j)^2);
       fyy = 0;
       d0 = y1(j);
       d1 = f;
       d2 = fx + f*fy;
       d3 = fxx + fxy*f + (fx+fy*f)*fy + f*(fxy+fyy*f);
       y1(j+1) = d0 + h*d1 + .5*h^2*d2 + h^3*d3/6;
    end
    
    % h = 0.001
    h = 0.001;
    T2 = a:h:b; N2 = length(T2);
    y2 = zeros(1,N2); y2(a) = ya;
    
    for j=1:N2-1
       f = (1-20*T2(j)*y2(j))/(T2(j)^2);
       fx = (20*T2(j)*y2(j)-2)/(T2(j)^3);
       fxx = (6-40*T2(j)*y2(j))/T2(j)^4;
       fy = -20/T2(j);
       fxy = 20/(T2(j)^2);
       fyy = 0;
       d0 = y2(j);
       d1 = f;
       d2 = fx + f*fy;
       d3 = fxx + fxy*f + (fx+fy*f)*fy + f*(fxy+fyy*f);
       y2(j+1) = d0 + h*d1 + .5*h^2*d2 + h^3*d3/6;
    end
    
    % h = 0.0001
    h = 0.0001;
    T3 = a:h:b; N3 = length(T3);
    y3 = zeros(1,N3); y3(a) = ya;
    
    for j=1:N3-1
       f = (1-20*T3(j)*y3(j))/(T3(j)^2);
       fx = (20*T3(j)*y3(j)-2)/(T3(j)^3);
       fxx = (6-40*T3(j)*y3(j))/T3(j)^4;
       fy = -20/T3(j);
       fxy = 20/(T3(j)^2);
       fyy = 0;
       d0 = y3(j);
       d1 = f;
       d2 = fx + f*fy;
       d3 = fxx + fxy*f + (fx+fy*f)*fy + f*(fxy+fyy*f);
       y3(j+1) = d0 + h*d1 + .5*h^2*d2 + h^3*d3/6;
    end
    
    figure(); plot(T1,y1,T2,y2,T3,y3,T3,f_ex(T3))
    title("3rd Order Taylor Series Approx"); legend("h = 0.01","h = 0.001","h = 0.0001","Exact")
    
    relerr1 = relerr(f_ex, T1, y1);
    relerr2 = relerr(f_ex, T2, y2);
    relerr3 = relerr(f_ex, T3, y3);
    figure(); plot(T1, relerr1, T2, relerr2, T3, relerr3)
    title("3rd Order Taylor Series Relative Error"); legend("h = 0.01", "h = 0.001", "h = 0.0001")
    
    function relerr = relerr(f_ex, x, y)
        y_ex = f_ex(x);
        relerr = abs(y_ex - y) ./ (abs(y_ex) + eps);
    end
end