function [c] = fixedpoint(g, x0, tol, maxiter)
xk = x0;
for k=1:maxiter
    xkplus1 = g(xk);
    abserr = abs(xkplus1 - xk);
    relerr = abserr / (abs(xk) + eps);
    if (abserr < tol) && (relerr < tol)
        c = xkplus1;
        return
    end
    xk = xkplus1;
end   
c = xkplus1;