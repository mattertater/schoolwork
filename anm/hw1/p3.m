x1 = 5:1:10;
y1 = sqrt(x1 .^ 3 + 1) .* sin(x1);

x2 = 5:0.01:10;
y2 = sqrt(x2 .^ 3 + 1) .* sin(x2);

figure(1)
plot(x1, y1, 'o', x2, y2)