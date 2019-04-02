% Matt McDade
% System Simulation
% Midterm Exam Problem 4C

Nt=20;
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
    zeta= (z.^2 - (236/151)*z + (85/151)) ./ ((70/151)*z.^2 + (44/151)*z - (48/151));
    hold on
        plot(real(zeta),imag(zeta))
    hold off
end

for k=1:length(tvec)-1
    z=rho*exp(i*tvec(k));
    zeta= (z.^2 - (236/151)*z + (85/151)) ./ ((70/151)*z.^2 + (44/151)*z - (48/151));
    hold on
        plot(real(zeta),imag(zeta))
    hold off
end

axis([-5 1 -3 3])
axis square
