% Matt McDade
% HW5 - Problem 1
% Chebyshev versus Newton

f = @(x) exp(-(x.^2)); % function

% Newton
X = -5:(2/3):5;  % equidistant points to compute the interpolating polynomial 
Y = f(X);  % corresponding y values
x = -5:0.01:5;  % points to plot
y = f(x);
C = divdiff(X,Y); % computes the diagonal from the divided difference table
N = zeros(1,length(x));
for i=1:length(x)
   N(i) = newtval(C,X,x(i));  % evaluates the newton polynomial at x(i)
end
subplot(1,2,1)
plot(X,Y,'o',x,y,'k',x,N,'r'),title('Newton Interpolation'),
                                     legend('Data','Exact','Newton')
axis([-5 5 -0.01 1.2])

% Chebyshev
N = length(X); % same number of points as in Newton;
t = zeros(1,N);
c = zeros(1,N);
for k=1:N
   t(k) = cos( (2*k-1)*pi/(2*N) ); % Chebyshev points 
   c(k) = t(k)*(5+5)/2 + (5-5)/2; % Chebyshev points in [-5,5] 
end
Y = f(c);
C = divdiff(c,Y);
Ch = zeros(1,length(x));
for i=1:length(x)
   Ch(i) = newtval(C,c,x(i));
end

subplot(1,2,2)
plot(c,Y,'o',x,y,'k',x,Ch,'r'),title('Chebyshev Interpolation'),
                                        legend('Data','Exact','Chebyshev')
axis([-5 5 -0.01 1.2])