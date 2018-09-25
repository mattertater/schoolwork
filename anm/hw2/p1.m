f1 = @(x) x.^2 - x;
f2 = @(x) x.^2 - (2*x);
a = 1;
b = 3;
tol = 1 * 10 .^ -8;
[root, iter] = bisect(f1, a, b, tol);
fprintf('Root of %s is found to be %d in %d iterations\n', func2str(f1), root, iter)
[root, iter] = bisect(f2, a, b, tol);
fprintf('Root of %s is found to be %d in %d iterations\n', func2str(f2), root, iter)