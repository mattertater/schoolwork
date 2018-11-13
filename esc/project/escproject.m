clc;
clear all;
close all;

w = 1643.838;
t = .1;
m = 16.001616040804 * w .^4 


OmegaCont=linspace(0,2*pi,10001); % Omega for cont
OmegaDisc=linspace(0,2*pi,w); % Omega for discrete

% Continuous
s=exp(1i*OmegaCont);
num = m;
den1 = (s.^2 + 0.7654*s*w + 1.0000505* w.^2);
den2 = (s.^2 + 1.8478*s*w + 1.0000505* w.^2);
den = den1 .* den2;
Hc = num ./ den;

% Plot continuous
figure(1)
subplot(211)
semilogx(OmegaCont,20*log10(abs(Hc)))
xlabel('\Omega (rad/sample)')
ylabel('magnitude (dB)')
subplot(212)
semilogx(OmegaCont,angle(Hc)*180/pi)
xlabel('\Omega (rad/sample)')
ylabel('phase (deg)')


% Discrete
z = exp(1i*OmegaDisc);
s = ((z-1)/t);
den1 = (s.^2 + 0.7654*s*w + 1.0000505* w.^2);
den2 = (s.^2 + 1.8478*s*w + 1.0000505* w.^2);
den = den1 .* den2;
Hd = num ./ den;

% Plot Discrete
figure(2)
subplot(211)
semilogx(OmegaDisc,20*log10(abs(Hd)))
xlabel('\Omega (rad/sample)')
ylabel('magnitude (dB)')
subplot(212)
semilogx(OmegaDisc,angle(Hd)*180/pi)
xlabel('\Omega (rad/sample)')
ylabel('phase (deg)')


% Discrete approximation
z = exp(1i*OmegaDisc);
num = (t.^4) * m;
den1 = (z.^2 + 339828979.15625*z - 339828980.15625); % 36 bits, 6 f
den2 = (z.^2 + 820831359.265625*z - 820831360.265625); % 37 bits, 6 f
den = den1 .* den2;
Hda = num ./ den;

% Plot discrete approximation
figure(3)
subplot(211)
semilogx(OmegaDisc,20*log10(abs(Hda)))
xlabel('\Omega (rad/sample)')
ylabel('magnitude (dB)')
subplot(212)
semilogx(OmegaDisc,angle(Hda)*180/pi)
xlabel('\Omega (rad/sample)')
ylabel('phase (deg)')