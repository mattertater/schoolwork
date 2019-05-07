% Matt McDade
% System Simulation
% Homework 7 Part B

N = 40001;
T = 0.001;
tPause = 0.01;
Nstart = floor(N/2);

sigma = 10;
beta = 8/3;
R = 28;

k = 1;
x(k) = 1;
y(k) = 2;
z(k) = 10;
fx(k) = sigma * (y(k) - x(k));
fy(k) = -x(k) * z(k) + R*x(k) - y(k);
fz(k) = x(k) * y(k) - beta*z(k);

x(k+1) = x(k) + T*fx(k);
y(k+1) = y(k) + T*fy(k);
z(k+1) = z(k) + T*fz(k);
fx(k+1) = sigma * (y(k+1) - x(k+1));
fy(k+1) = -x(k+1) * z(k+1) + R*x(k+1) - y(k+1);
fz(k+1) = x(k+1) * y(k+1) - beta*z(k+1);

x(k+2) = x(k+1) + (3/2)*T*fx(k+1) - (1/2)*T*fx(k);
y(k+2) = y(k+1) + (3/2)*T*fy(k+1) - (1/2)*T*fy(k);
z(k+2) = z(k+1) + (3/2)*T*fz(k+1) - (1/2)*T*fz(k);
fx(k+2) = sigma * (y(k+2) - x(k+2));
fy(k+2) = -x(k+2) * z(k+2) + R*x(k+2) - y(k+2);
fz(k+2) = x(k+2) * y(k+2) - beta*z(k+2);

x(k+3) = x(k+2) + (23/12)*T*fx(k+2) - (16/12)*T*fx(k+1) + (5/12)*T*fx(k);
y(k+3) = y(k+2) + (23/12)*T*fy(k+2) - (16/12)*T*fy(k+1) + (5/12)*T*fy(k);
z(k+3) = z(k+2) + (23/12)*T*fz(k+2) - (16/12)*T*fz(k+1) + (5/12)*T*fz(k);

for k = 1:N-4
    fx(k+3) = sigma * (y(k+3) - x(k+3));
    fy(k+3) = -x(k+3) * z(k+3) + R*x(k+3) - y(k+3);
    fz(k+3) = x(k+3) * y(k+3) - beta*z(k+3);
    
    x(k+4) = x(k+3) + (55/24)*T*fx(k+3) - (59/24)*T*fx(k+2) + (37/24)*T*fx(k+1) - (9/24)*T*fx(k);
    y(k+4) = y(k+3) + (55/24)*T*fy(k+3) - (59/24)*T*fy(k+2) + (37/24)*T*fy(k+1) - (9/24)*T*fy(k);
    z(k+4) = z(k+3) + (55/24)*T*fz(k+3) - (59/24)*T*fz(k+2) + (37/24)*T*fz(k+1) - (9/24)*T*fz(k);
end

figure(1)
subplot(221)
plot(x(Nstart:N), y(Nstart:N))
xlabel('x')
ylabel('y')

subplot(222)
plot(x(Nstart:N), z(Nstart:N))
xlabel('x')
ylabel('z')

subplot(223)
plot(y(Nstart:N), z(Nstart:N))
xlabel('y')
ylabel('z')

figure(2)
plot3(x, y, z)
xlabel('x')
ylabel('y')
zlabel('z')