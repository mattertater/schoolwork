function [x0, k] = jacobi(a,b,x0,tol,maxiter)
n = length(b);
x = x0;
for k=1:maxiter
   for j=1:n
       x(j) = (b(j) - a(j, [1:j-1, j+1:n]) * x0([1:j-1,j+1:n])) / a(j,j);
       abserr=norm(x-x0);
       relerr=abserr/norm(x+eps);
       if(abserr<tol && relerr<tol)
           return
       end
   end
   x0=x;
end