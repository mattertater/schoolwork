x = linspace(-1, 1, 101);
y = exp(1./(x.^2 - 1));
y(1) = 0;
y(length(y)) = 0;

p = polyfit(x, y, 10);
x1 = linspace(-1, 1);
y1 = polyval(p, x1);
% plot(x, y, 'o', x1, y1, 'b-')

x = linspace(0, 1, 101); 
y = besselj(1,x);
xx = linspace(0, 1, 1001);
yy = besselj(1, xx);

p = polyfit(x, y, 8);
x1 = linspace(0, 1);
y1 = polyval(p, x1);

pp = polyfit(xx, yy, 8);
yy1 = polyval(pp, x1);

plot(x, y, 'o', x1, y1, 'b-', x1, yy1, 'r-')
legend('Data', '101 Points', '1001 Points')

diff1 = y(floor(length(y)/2)) - yy(floor(length(yy)/2))
diff2 = y(floor(length(y)/3)) - yy(floor(length(yy)/3))
diff3 = y(floor(length(y)/4)) - yy(floor(length(yy)/4))