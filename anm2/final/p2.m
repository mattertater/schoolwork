% Matt McDade
% ANM 2
% Final Exam Problem 2

dx = 1e-2;  x = 0:dx:1;
dt = 1e-4;  t = 0:dt:2;
N = length(x);
nmax = length(t);
np = 500;

u2 = zeros(N,2);

g = @(x) 4*exp(-5*(x-3).^2); % IC

R = fu(u)*dt/dx;

% IC
u2(:,1) = g(x);
figure(1)
plot(x,u2(:,1),'r')
title('Classic Method')
axis([0 10 -1.2 5])
pause

for n=1:nmax-1
    u2(1,2) = 0;
    for i=2:N-1
        R = fu(u2(i,1))*dt/dx;
        A = .5*(u2(i,1) + u2(i+1,1)) - .5*dt/dx*(fu(u2(i+1,1))-fu(u2(i,1)));
        B = .5*(u2(i-1,1) + u2(i,1)) - .5*dt/dx*(fu(u2(i,1))-fu(u2(i-1,1)));
        u2(i,2) = u2(i,1) - dt/dx*(fu(A)-fu(B));
    end
    if (mod(n,np)==0)
        plot(x,u2(:,2))
        axis([0 10 -1.2 5])
        pause(0.2)
        %fprintf('%d\n',n)
    end
    u2(:,1) = u2(:,2);
end

function z = fu(u)
    z = u - (4-u).^3 / 3;
end