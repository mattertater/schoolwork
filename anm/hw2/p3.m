g1 = @(x) (5 - log(x)) / 3;
g2 = @(x) exp(-3 * x + 5);
x0 = 1;
tol = 10^(-9);
c1 = zeros(1, 20);
c2 = zeros(1, 20);

for max1 = 1:20
    c1(max1) = fixedpoint(g1, x0, tol, max1);
    c2(max1) = fixedpoint(g2, x0, tol, max1);
end
fprintf('Root: %.9f\n', c1(18))
figure(1); plot(c1)
figure(2); plot(c2)