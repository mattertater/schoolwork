clc;
close all;
Omega = linspace(0, 2*pi);
s = exp(1i*Omega);

Wc = 261.625*2*pi;

A = Wc*exp(1i*(5*pi/8));
B = Wc*exp(1i*(7*pi/8));
C = Wc*exp(1i*(9*pi/8));
D = Wc*exp(1i*(11*pi/8));

A1 = 4;
A2 = 4;

N = A1*A2;
D1 = (s.^2-s*(A+B)+ A*B);
D2 = (s.^2-s*(C+D)+C*D);

D = D1.*D2;

%Continuous 
Hc = N./(D);

m=10.^-3;
T = 1000*m;
z = exp(1i*Omega/T);
s = (z-1)./T;

%Discrete 
Hd = T.^2*N./(((z-1).^2-(A+B).*(z-1).*T+A.*B).*((z-1).^2-(C+D).*(z-1).*T+C.*D));

figure(1)
subplot(211)
semilogx(Omega,20*log10(abs(Hc)))
xlabel('\Omega (rad/sample)')
ylabel('magnitude (dB)')
subplot(212)
semilogx(Omega,angle(Hc)*180/pi)
xlabel('\Omega (rad/sample)')
ylabel('phase (deg)')
set(gca,'fontsize',16)

figure(2)
subplot(211)
semilogx(Omega,20*log10(abs(Hd)))
xlabel('\Omega (rad/sample)')
ylabel('magnitude (dB)')
subplot(212)
semilogx(Omega,angle(Hd)*180/pi)
xlabel('\Omega (rad/sample)')
ylabel('phase (deg)')
set(gca,'fontsize',16)

figure(3)
sys=tf([16],[1, -((C+D)+(A+B)),((C*D)+(A+B)*(C+D)+(A*B)), -((A+B)*(C*D)+(A*B)*(C+D)), ((A*B)*(C*D))],0.1)
bode(sys)
set(gca,'fontsize',16)