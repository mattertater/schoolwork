% Matt McDade
% System Simulation
% HW 8

Nr = 15;
theta = linspace(-pi, pi, 1001);
rvec = linspace(0, 1, Nr);

for k = 1:Nr
    hold on;
    z = rvec(Nr+1-k) * exp(1i*theta);
    zeta = 12 * (z-1) ./ (23 - (16./z) + (5./(z.^2)));
    plot(zeta)
    hold off;
end

title('AB3 Stability Region')
axis([-1 1 -1 1])