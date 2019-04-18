% Matt McDade
% ANM 2 
% HW 6

% Not sure what I'm doing here, I'm definitely missing a lot

alpha = 3;
r = 1;
dx = 1e-2;
dt = 1e-5;
x = 0:dx:10;
N = length(x);
u = zeros(N,2);

u(:,1) = sin(x);

plot(x,u(:,1)),axis([0 1 -1 1])

for j=2:800
   u(1,2) = 0;
   u(N,2) = 0;
   for i=2:N-1
    u(i,2) = u(i,1) + (r/alpha)*(u(i-1,1)-2*u(i,1)+u(i+1,1));
   end
   if (mod(j+1, 10000)==0)
   plot(x,u(:,2))
   end
   u(:,1) = u(:,2);
end