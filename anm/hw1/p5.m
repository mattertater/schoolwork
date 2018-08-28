f = @(x) sin(x.^3);

fprintf('f(%.8f) = %.10e \n', 5.201, f(5.201))
fprintf('f(%.8f) = %.10e \n', -8323.6, f(-8323.6))
fprintf('f(%.8f) = %.10e \n', 0.0003, f(0.0003))