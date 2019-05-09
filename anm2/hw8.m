% Matt McDade
% ANM 2 
% Homework 8

dx = 0.01; dy = 0.01;
x = 0:dx:5; y = 0:dy:4;
imax = length(x); jmax = length(y);
D=2; a = .3; b = .4; c = 1;
alpha = D*(2/dx^2+2/dy^2)-c;  
S = @(x, y) -800*exp(-10*((x-1).^2 + (y-2).^2));
u = zeros(imax, jmax);

error = 10000;
omega = 1.95;
itermax = 10000;
tol = 100;
iter = 1;

while(iter < itermax && error > tol)
    error = 0;
    
    for i = 2:imax-1
        for j = 2:jmax-1
            T = D*((u(i-1,j)+u(i+1,j))/dx^2+(u(i,j-1)+u(i,j+1))/dy^2) ...
                + a*(u(i+1,j)-u(i-1,j))/(2*dx) + b*(u(i,j+1)-u(i,j-1))/(2*dy) ...
                + S(x(i),y(j));
            R = T/alpha - u(i,j);
            error = error + abs(R);
            u(i,j) = u(i,j) + omega*R;
        end
    end
    
    %fprintf('%d: %e\n', iter, error)
    if (mod(iter, 10) == 0)
        mesh(x, y, u')
        drawnow
    end
    
    iter = iter + 1;
end
mesh(x, y, u')

function z = g(x)
    z = 50 + x;
    if (1 <= x && x <= 3)
        z = 100;
    end
end