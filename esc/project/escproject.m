clc;
clear all;
close all;

w = 1643.838;
t = .0005;
m = 16.001616040804 * w .^4 ;


OmegaCont=linspace(0,2000*pi,10001); % Omega for cont
OmegaDisc=linspace(0,pi,w); % Omega for discrete

% Continuous
s = 1i * OmegaCont;
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
s = log(z)/t;
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
% t and w already plugged in

z = exp(1i*OmegaDisc);
num = ((z + 1).^4) * 0.15955904;
den1 = (z.^2 - 1.125.*z + 0.5625);
den2 = (z.^2 - 0.875.*z + 0.21875);
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
ylabel('hase (deg)')