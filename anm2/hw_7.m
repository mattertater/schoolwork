% Matt McDade
% ANM 2 
% Homework 7

% I know this isn't right

alpha = 2;
dx = 1e-3;
dt = 1e-3;
x = 1:dx:9;
N = length(x);
u = zeros(N,1);
rt = alpha*dt/dx^2

AL(1) = 0; AM(1) = 1; AR(1) = 0;
for i=2:N-1
   AL(i) = -rt/2;
   AM(i) = 1+rt;
   AR(i) = -rt/2;
end
AL(N) = 0; AM(N) = 1; AR(N) = 0;

hold on;
u = sin(x);
plot(x,u),title('Crank-Nicolson with rtilde=2 (classic is unstable)')

for n=1:599
   b(1) = 0;
   for i=2:N-1
      b(i) = u(i)+rt/2*(u(i-1)-2*u(i)+u(i+1));
   end
   b(N) = 0;
   u = tridiag(AL,AM,AR,b);
   
   % plot every 10% of the way
   np = (N-1)/10;
   if (mod(n, np) == 0)
       plot(x, u)
   end
end