Nt=21;
Nr=12;


theta=linspace(0,2*pi,1001);
rho=linspace(0,1,1001);

tvec=linspace(0,2*pi,Nt);
rvec=linspace(0,1,Nr);

figure(1)
clf
hold on
    plot(rho*0,4*rho-2,'k')
    plot(4*rho-3,rho*0,'k')
hold off
for k=1:length(rvec)
    z=rvec(k)*exp(i*theta);
    zeta=(z-1)./(z+1);
    hold on
        plot(real(zeta),imag(zeta))
    hold off
end

for k=1:length(tvec)-1
    z=rho*exp(i*tvec(k));
    zeta=(z-1)./(z+1);
    hold on
        plot(real(zeta),imag(zeta))
    hold off
end

axis([-3 1 -2 2])
axis square
