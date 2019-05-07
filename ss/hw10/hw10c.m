% Matt McDade
% System Simulation
% HW 10 Part C & D

Nr = 12;
Ntheta = 50;
theta = linspace(0, (Ntheta-1) / Ntheta, Ntheta) * 2 * pi;

rho    = linspace(1, Nr, Nr) / Nr;
rho_cw  = linspace(1, Nr, Nr) / Nr;
rho_ccw = linspace(1, Nr, Nr) / Nr;
p      = linspace(0, 2*pi, 1001);

for m=1:Nr
    r = rho(Nr - m + 1);
    z = r * exp(1i * p);
    w = 2 * z .* (z-1) ./ (3*z-1);
    if (r > 0.57)
        rho_ccw(m) = 100;
        subplot(121)
        title('AB2: Stability Region')
        hold on
        plot(real(w), imag(w))
        hold off
        axis([-1 1 -1 1])
    else
        rho_cw(m) = 0;
        subplot(122)
        title('r = 1')
        hold on
        plot(real(w), imag(w))
        hold off
        axis([-1 1 -1 1])
    end
end

r1 = linspace(min(rho_ccw), 1, 1001);
r2 = linspace(0, max(rho_cw), 1001);

for m = 1:length(theta)
    z1 = r1 * exp(1i * theta(m));
    z2 = r2 * exp(1i * theta(m));
    w1 = 2 * z1 .* (z1 - 1) ./ (3*z1-1);
    w2 = 2 * z2 .* (z2-1) ./ (3*z2-1);
    
    subplot(121)
    hold on
    plot(real(w1), imag(w1))
    hold off
    
    subplot(122)
    hold on
    plot(real(w2), imag(w2))
    hold off
end

% Plot poles for part D
subplot(121)
hold on
plot(-0.147597,   0.38759,  'X')
plot(-0.147597,  -0.38759,  'X')
plot(-0.0611034,  0.935565, 'X')
plot(-0.0611034, -0.935565, 'X')
hold off