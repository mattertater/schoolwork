function result = csimp(f,a,b,n)
delta_x = (b-a)/n;
x = [a:delta_x:b];
x4 = 0; x2 = 0;
for i=2:(((n+1)/2) - 1)
    x2 = x2 + f(x(2*i));
end
for i=2:((n+1)/2)
    x4 = x4 + f(x(2*i));
end
result = (delta_x./3).*(f(a)+ f(b) + 4.*x4+ 2.*x2);
end