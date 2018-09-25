f = @(x) x^3 - (0.001 * x^2) + x - 0.001;
x0 = 50;
x1 = 49;
tol = 10^(-10);
maxiter = 20;
[root, iter] = secant(f, x0, x1, tol, maxiter);
fprintf('Root: %.8f found in %d iterations\n', root(maxiter), iter)