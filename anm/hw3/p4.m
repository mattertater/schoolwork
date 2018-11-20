a = [4 1 -1;
    -1 5 2; 
    -2 1 6];
b = [13; 8; 2];
tol = 1e-10;
maxiter = 100;
[s, k] = gauss_seidel(a, b, [0; 0; 0], tol, maxiter)
[s, k] = gauss_seidel(a, b, [10; 20; -30], tol, maxiter)