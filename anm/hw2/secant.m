function [cv, k] = secant(f, x0, x1, tol, maxiter)
cv = zeros(1, maxiter);
cv(1) = x0;
cv(2) = x1;
for k=2:maxiter
    cv(k + 1) = cv(k) - (f(cv(k)) / (f(cv(k)) - f(cv(k-1)) / cv(k) - cv(k-1)));
    abserr = abs(cv(k+1) - cv(k));
    relerr = abserr / (abs(cv(k)) + eps);

    if (abserr < tol) && (relerr < tol)
        cv(maxiter) = cv(k+1);
        break;
    end
end
