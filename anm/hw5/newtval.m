function y = newtval(C,X,r)

n = length(C);
y = C(n);
for k=n-1:-1:1
   y = C(k) + (r-X(k))*y;
end
