f = @(x) x^3 - (0.001 * x^2) + x - 0.001;
fp = @(x) 3*x^2 - 0.002 * x + 1;
x0 = 50;
tol = 10^(-10);
maxiter = 20;
[root, iter] = newton(f, fp, x0, tol, maxiter);
fprintf('Root: %.8f found in %d iterations\n', root(maxiter), iter)