function [cv, k] = newton(f, fp, x0, tol, maxiter)
cv = zeros(1, maxiter);
cv(1) = x0;
for k=1:maxiter
    cv(k + 1) = cv(k) - (f(cv(k))/fp(cv(k)));
    abserr = abs(cv(k+1) - cv(k));
    relerr = abserr / (abs(cv(k)) + eps);
    if (abserr < tol) && (relerr < tol)
        cv(maxiter) = cv(k+1);
        break;
    end
end
