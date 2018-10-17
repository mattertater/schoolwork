


Omega=linspace(0,pi,10001);      %Set up vector of Omega
z=exp(i*Omega);                  %Define z on unit circle
H=(z.^2)./(z.^2-1.8*z+0.82);     %Calculate the values of H on the unit circle


% Create the frequency response plots for linear Omega (discrete-time 
% frequency) with the magnitude (unitless) and phase (rad)

figure(1)
subplot(211)
plot(Omega,abs(H))
xlabel('\Omega (rad/sample)')
ylabel('|H(e^{i\Omega})|')

subplot(212)
plot(Omega,angle(H))
xlabel('\Omega (rad/sample)')
ylabel('arg(H(e^{i\Omega}))')
set(gca,'fontsize',16)


% Create the frequency response plots for semilog Omega (discrete-time
% frequency with the magnitude (dB) and phase (deg)

figure(2)
subplot(211)
semilogx(Omega,20*log10(abs(H)))
xlabel('\Omega (rad/sample)')
ylabel('magnitude (dB)')
axis([10^(-3) 10 -15 35])
subplot(212)
semilogx(Omega,angle(H)*180/pi)
xlabel('\Omega (rad/sample)')
ylabel('phase (deg)')
axis([10^(-3) 10 -135 0])
set(gca,'fontsize',16)

% Create the frequency response plots using the MATLAB bode command [the
% result is a semilog (lower-case) omega (continuous-time) frequency with
% the magnitude (dB) and phase (deg)
figure(3)
sys=tf([1 0 0],[1 -1.8 0.82],0.001)
bode(sys)
set(gca,'fontsize',16)