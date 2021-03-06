% Matt McDade
% System Simulation
% HW 13

N = 10001;
T = 0.01;
alpha = 1;

x = [1 N];

xp  = zeros(1, N);
yp  = zeros(1, N);
zp  = zeros(1, N);
fxp = zeros(1, N);
fyp = zeros(1, N);
fzp = zeros(1, N);
xc  = zeros(1, N);
yc  = zeros(1, N);
zc  = zeros(1, N);
fxc = zeros(1, N);
fyc = zeros(1, N);
fzc = zeros(1, N);

xc(1) = 1;
yc(1) = 1;
zc(1) = 1;

for k = 1:N-1
    fxc(k) = alpha * (yc(k) + ((xc(k) - 2*(xc(k).^3)) / 7));
    fyc(k) = xc(k) - yc(k) + zc(k);
    fzc(k) = -(100/7) * yc(k);
    
    xp(k+1) = xc(k) + T*fxc(k);
    yp(k+1) = yc(k) + T*fyc(k);
    zp(k+1) = zc(k) + T*fzc(k);
    
    fxp(k) = alpha * (yp(k+1) + ((xp(k+1) - 2*(xp(k+1).^3)) / 7));
    fyp(k) = xp(k+1) - yp(k+1) + zp(k+1);
    fzp(k) = -(100/7) * yp(k+1);
    
    xc(k+1) = xc(k) + T*fxp(k);
    yc(k+1) = yc(k) + T*fyp(k);
    zc(k+1) = zc(k) + T*fzp(k);
end

figure(1)
plot3(xc, yc, zc)
xlabel('xc')
ylabel('yc')
zlabel('zc')
title('Chuas System')

figure(2)
plot(xc, fxc)
xlabel('xc')
ylabel('fxc')
title('x corrected')

figure(3)
plot(yc, fyc)
xlabel('yc')
ylabel('fyc')
title('y corrected')

figure(4)
plot(zc, fzc)
xlabel('zc')
ylabel('fzc')
title('z corrected')