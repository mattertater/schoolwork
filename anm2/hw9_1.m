% Matt McDade
% ANM 2
% Homework 9 Part 1

dx = 1e-2;  x = 0:dx:10;
dt = 1e-4;  t = 0:dt:2;
N = length(x);
nmax = length(t);
np = (nmax-1)/10;

u2 = zeros(N,2);

a = 4;
f = @(t) 0.4*sin(2*t); % BC
g = @(x) exp(-20*(x-3).^2); % IC

R = a*dt/dx;

% IC
u2(:,1) = g(x);
figure(1)
plot(x,u2(:,1),'r')
title('Lax-Wendroff')
axis([0 10 -1.2 1.2])
pause

for n=1:nmax-1
    u2(1,2) = f(t(n+1));
    for i=2:N-1
        R = a*dt/dx;
        if (i == N-1)
            uxx = 0;
        else
            uxx = u2(i-1,1)-2*u2(i,1)+u2(i+1,1);
        end
        ux = u2(i+1,1)-u2(i-1,1);
        u2(i,2) = u2(i,1) - .5*R*ux + .5*R^2*uxx;
    end
    u2(N,2) = 2*u2(N-1,2) - u2(N-2,2);
    if (mod(n,np)==0)
        plot(x,u2(:,2))
        axis([0 10 -1.2 1.2])
        pause(0.2)
        fprintf('%d\n',n)
    end
    u2(:,1) = u2(:,2);
end