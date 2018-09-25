f = @(x) cos(x) + (1 / (x^3 + 200));
a = -5;
b = 5;
tol = 1 * 10 .^ -10
% 4 roots can be seen in the plot
figure(1)
fplot(f)
[r1, i1] = bisect(f, -5, -3, tol);
[r2, i2] = bisect(f, -3, -1, tol);
[r3, i3] = bisect(f, 1, 3, tol);
[r4, i4] = bisect(f, 4, 5, tol);
fprintf('Root 1: %.8f in %d iterations\n', r1, i1)
fprintf('Root 2: %.8f in %d iterations\n', r2, i2)
fprintf('Root 3: %.8f in %d iterations\n', r3, i3)
fprintf('Root 4: %.8f in %d iterations\n', r4, i4)