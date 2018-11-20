Omega=linspace(0,pi,10001);
z=exp(i*Omega);
H=(z.^2 + 2*z + 1)./(z.^2 - 1.75*z + 0.8672)  ;
Hbar=(z.^2 + 2*z + 1)./(z.^2 - 1.75*z + 0.875);

figure(1)
subplot(211)
plot(Omega,abs(H))
xlabel('\Omega (rad/sample)')
ylabel('|H(e^{i\Omega})|')

subplot(212)
plot(Omega,angle(H))
xlabel('\Omega (rad/sample)')
ylabel('arg(H(e^{i\Omega}))')


figure(2)
subplot(211)
plot(Omega,abs(Hbar))
xlabel('\Omega (rad/sample)')
ylabel('|H(e^{i\Omega})|')

subplot(212)
plot(Omega,angle(Hbar))
xlabel('\Omega (rad/sample)')
ylabel('arg(H(e^{i\Omega}))')

