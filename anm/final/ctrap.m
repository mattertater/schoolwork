function result = ctrap(f, a, b, n)
delta_x = (b-a)/n;
x = [a+delta_x:delta_x:b-delta_x];
result = 0;
for i = 1:n-1
    result = result + f(x(i));
end
result = delta_x * (result + 0.5 * (f(a)+f(b)));
end