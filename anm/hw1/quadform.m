function [xp, xm] = quadform(a, b, c)
xp = (-b + sqrt(b.^2 - 4*a*c))/(2*a);
xm = (-b - sqrt(b.^2 - 4*a*c))/(2*a);