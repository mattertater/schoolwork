function result = simp(f, a, b)
result = ((b - a) ./ 3) .* (f(a) + f(b));
end