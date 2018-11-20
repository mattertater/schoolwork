%Frequency
w = 1643.83836;
Omega=linspace(0,pi,w);      %Set up vector of Omega for Discrete time
Omega1=linspace(0,pi,10001);      %Set up vector of Omega for Continuous Time

%Setting up the Discrete Time Transfer Funtion using Tustin Approximation
z=exp(i*Omega);              %Define z on unit circle
Htustin=15.4743.*[(z+1).^2.*(z+1).^2./(z.^2+1.98096*z+0.981551).*(z.^2+1.95545*z+0.956033)]; %Tustin Approximation
Htustinaprox=15.4688.*[(z+1).^2.*(z+1).^2./(z.^2+1.9844*z+0.98438).*(z.^2+1.9531*z+0.95312)]; %Tustin Approximation with f = 6

%Continuous Time Function Coefficients
aa = 1;
ba = 4295.55;
ca = 9.22586*10.^6;
da = 1.16074*10.^10;
ea = 7.30188*10.^12;

ab = 0;
bb = 0;
cb = 0;
db = 0;
eb = 1.1683*10.^14;

%Setting up the Continuous Time Transfer Function
a1 = [aa ba ca da ea];
b1 = [ab bb cb db eb];
freqs(b1,a1,Omega1)
h1 = freqs(b1,a1,Omega1);
mag1 = abs(h1);
phase1 = angle(h1);
phasedeg1 = phase1*180/pi;


%Tustin approximation
figure(1)
subplot(211)
semilogx(Omega,20*log10(abs(Htustin)))
xlabel('\Omega (rad/sample)')
ylabel('magnitude (dB)')
subplot(212)
semilogx(Omega,angle(Htustin)*180/pi)
xlabel('\Omega (rad/sample)')
ylabel('phase (deg)')

%Tustin approximation with f = 6
figure(2)
subplot(211)
semilogx(Omega,20*log10(abs(Htustinaprox)))
xlabel('\Omega (rad/sample)')
ylabel('magnitude (dB)')
subplot(212)
semilogx(Omega,angle(Htustinaprox)*180/pi)
xlabel('\Omega (rad/sample)')
ylabel('phase (deg)')

%Continuous Time Frequency Response
figure(3)
subplot(211)
semilogx(Omega1,20*log10(mag1))
xlabel 'Omega (rad/sample)'
ylabel 'Magnitude (dB)'
subplot(212)
semilogx(Omega1,phasedeg1)
xlabel('Omega (rad/sample)')
ylabel('phase (deg)')