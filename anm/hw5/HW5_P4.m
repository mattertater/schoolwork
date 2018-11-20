% HW 5 Problems 4 - Example
% Cubic Splines


% Create matrix 
A = [1 0 0 0 0 0 0 0;
    1 1 1 1 0 0 0 0;
    0 0 0 0 1 0 0 0;
    0 0 0 0 1 1 1 1;
    0 1 2 3 0 -1 0 0;
    0 0 2 6 0 0 -2 0;
    0 1 0 0 0 0 0 0;
    0 0 0 0 0 1 2 3;];

%Right-hand side
y = [0 1 1 .5 0 0 0 0]';

%Solving the system to find coefficients
a = A\y;

%Domain for each piece of cubic spline
x1 = 0:.01:1;
x2 = 1:.01:2;
%The three interpolating cubic splines
s1 = a(1) + a(2)*x1 + a(3)*x1.^2 +a(4)*x1.^3;
s2 = a(5) + a(6)*x2 + a(7)*x2.^2 +a(8)*x2.^3;

%Data points given
datax = [0, 1, 2];
datay = [0, 1, .5];

%Plot Results
plot(x1,s1,x2,s2,datax,datay,'ko','Markerfacecolor','k')
xlabel('x-values')
ylabel('y-values')
title('Cubic Spline Interpolation')
legend('S1(x)','S2(x)','Data Points')

fprintf('The coefficients are:\n')
for i = 1:8
    
    fprintf('a(%d) = %6.1f\n',i,a(i))
    
end