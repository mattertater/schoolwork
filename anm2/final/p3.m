% Matt McDade
% ANM 2
% Final Exam Problem 3

dx = 1e-2;  x = 0:dx:1;
dt = 1e-5;  t = 0:dt:0.001;
N = length(x);
nmax = length(t);
np = 5;

u2 = zeros(N,2);

g = @(x) exp(-5*(x-0.3).^2); % IC

% IC
u2(:,1) = g(x);
figure(1)
plot(x,u2(:,1),'r')
title('Classic Method')
pause

for n=1:nmax-1
    u2(1,2) = 0;
    u2(2,2) = 0;
    for i=3:N-1
        uxx = (u2(i+1,1) - u2(i-1,1))/(2*dx);
        u2(i,2) = D*uxx + 0.1*u(i,1)*(1-u(i,1));
    end
    if (mod(n,np)==0)
        plot(x,u2(:,2))
        pause(0.2)
        %fprintf('%d\n',n)
    end
    u2(:,1) = u2(:,2);
end