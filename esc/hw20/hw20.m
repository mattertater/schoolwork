x = 0:0.1:10;
x_2 = -10:0.1:20;
y = besselj(1,x);
y_2 = besselj(1, x_2);

cheby100 = chebyshevT(100, y);
cheby92 = chebyshevT(92, y);
cheby8 = cheby100 - cheby92;

cheby100_2 = chebyshevT(100, y_2);
cheby92_2 = chebyshevT(92, y_2);
cheby8_2 = cheby100_2 - cheby92_2;

figure(1)
plot(x, y, 'o', x, cheby100, 'r-', x, cheby8, 'b-')
legend('Data', 'Chebyshev 100', 'Chebyshev8')

figure(2)
plot(x_2, y_2, 'o', x_2, cheby100_2, 'r-', x_2, cheby8_2, 'b-')
legend('Data', 'Chebyshev 100', 'Chebyshev8')

l1 = (sum(abs(y-cheby8)))
matL1 = norm(y-cheby8,1)