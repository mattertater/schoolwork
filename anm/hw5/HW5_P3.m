% HW 5 Problems 3 - Example
% non-linear least squares using an exponential model f(x)=B*exp(Ax)

% data points
x = [0 1 2 3 4 5];
y = [0.1 1 1.5 0.8 0.3 0.25];

S = @(R) sum((R(2)*exp(R(1)*x)-y).^2); % least squares function
initguess = [1 1]; % initial guess for 
u = fminsearch(S, initguess); % finds the parameters that minimize S
yy = u(2)*exp(u(1)*xx);
plot(x, y, 'o', xx, yy, 'r-')