x = 0.234;

num1 = log(x - sqrt(x.^2 - 1))
num2 = -log(x + sqrt(x.^2 - 1))

fprintf('num1 = %.30f \n', num1)
fprintf('num2 = %.100f \n', num2)