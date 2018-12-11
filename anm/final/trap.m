function result = trap(f, a, b)
result = ((b - a) ./ 2) .* (f(a) + f(b));
end