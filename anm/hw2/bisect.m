function [c, k] = bisect(f, a, b, tol)
ya = f(a);
yb = f(b);
if ((ya * yb) > 0)
    disp('Bad interval')
    return
end
maxiter = 1 + floor(log((b-a)/tol)/log(2))
for k = 1:maxiter
    