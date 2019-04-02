eps=4;
T=0.01;

t0plot=0;
tfinal=40;
t=[0:T:tfinal];
N=length(t);
k0=1+floor(t0plot/T);


xp=zeros(2,N);
fp=xp;

xc(:,1)=[0 1]';
xp(:,1)=xc(:,1);


xpo=xp;
fpo=fp;



for k=1:N-1
    
    %--------------PECE------------------------------
    %P
    xp(:,k+1)=xc(:,k)+T*fp(:,k);
    
    %E
    fp(1,k+1)=xp(2,k+1);
    fp(2,k+1)=eps*(1-(xp(1,k+1))^2)*xp(2,k+1)-xp(1,k+1);
    
    %C
    xc(:,k+1)=xc(:,k)+T*fp(:,k+1);
    
    %E
    fc(1,k+1)=xc(2,k+1);
    fc(2,k+1)=eps*(1-(xc(1,k+1))^2)*xc(2,k+1)-xc(1,k+1);
    %--------------PECE------------------------------
    
    
    %Euler alone
    fpo(1,k)=xpo(2,k);
    fpo(2,k)=eps*(1-(xpo(1,k))^2)*xpo(2,k)-xpo(1,k);
    xpo(:,k+1)=xpo(:,k)+T*fpo(:,k);
    
end

figure(1)
plot(xp(1,k0:N),xp(2,k0:N),'--')
hold on
    plot(xc(1,k0:N),xc(2,k0:N),'-')
hold off
xlabel('x_1')
ylabel('x_2')
title('Van Der Pol System Phase Plot')

figure(2)
plot(t(k0:N),xp(1,k0:N)-xc(1,k0:N),'--')

xlabel('t')
ylabel('x_p-x_c')
title('Difference in the x_1 state between the predictor and corrector')

figure(3)
subplot(211)
plot(t(k0:N),xp(1,k0:N),'--')
hold on
    plot(t(k0:N),xc(1,k0:N),'-')
    plot(t(k0:N),xpo(1,k0:N),'r--')
hold off
axis([t(k0) t(N) 1.1*min(xc(1,:)) 1.1*max(xc(1,:))])
xlabel('t')
ylabel('x_1')
title('Simulation Results: Predictor (--, blue), Corrector (-, blue), Predictor Alone (--, red)')


subplot(212)
plot(t(k0:N),xp(2,k0:N),'--')
hold on
    plot(t(k0:N),xc(2,k0:N),'-')
    plot(t(k0:N),xpo(2,k0:N),'r--')
hold off
axis([t(k0) t(N) 1.1*min(xc(2,:)) 1.1*max(xc(2,:))])
xlabel('t')
ylabel('x_2')