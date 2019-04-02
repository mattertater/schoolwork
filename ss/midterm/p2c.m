% Matt McDade
% System Simulation
% Midterm Exam Problem 2C

Nt=10;
Nr=17;

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
    zeta= (z.^2 - (16/11)*z + (5/11)) ./ ((14/11)*z - (8/11));
    hold on
        plot(real(zeta),imag(zeta))
    hold off
end

for k=1:length(tvec)-1
    z=rho*exp(i*tvec(k));
    zeta= (z.^2 - (16/11)*z + (5/11)) ./ ((14/11)*z - (8/11));
    hold on
        plot(real(zeta),imag(zeta))
    hold off
end

axis([-2 2 -2 2])
axis square
