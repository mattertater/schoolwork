f = @(x) (exp(x).*sin(x)) ./ (x.^2 + 1);

x1 = 3:1:7;
y1 = f(x1);

x2 = 3:0.01:7;
y2 = f(x2);

figure(1)
plot(x1, y1, 'o', x2, y2)