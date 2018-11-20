% HW 5 Problems 2 - Example
% curve fitting

% data points
x = [0 1 2 3 4 5];
y = [4 -1 6 1 -4 -9];

% linear least squares using a quadratic model
C2 = lspoly(x,y,2); % finds the parameters
C3 = lspoly(x,y,3);
xx = 0:0.01:5;
y2 = zeros(1, length(xx));
y3 = zeros(1, length(xx));

% this loop evaluates the polynomial with the optimal parameters in the 
% node points defined in x3
for i=1:length(xx)
  y2(i) = horner(C2,xx(i));
  y3(i) = horner(C3,xx(i));
end

% plots data points and best fitting curve
plot(x, y, 'o', xx, y2, '-', xx, y3, '--'), legend('Data','2nd Degree','3rd Degree')

polyfit(xx, y2, 2)
polyfit(xx, y3, 3)