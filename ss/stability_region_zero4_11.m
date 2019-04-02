zeta=-0.28
p=roots([1 (-1-11*zeta/7) (-4*zeta/7)])
angle(p)

Nt=41;
Nr=12;


theta=linspace(0,2*pi,1001);
rho=linspace(0,1,1001);


z=(0.2283)*exp(i*theta);
w=(7/11)*(z.^2-z)./(z+(4/11));

figure(1)
plot(real(w),imag(w))

pause


z100=1.00*exp(i*theta);
w100=(7/11)*(z100.^2-z100)./(z100+(4/11));
z90=0.90*exp(i*theta);
w90=(7/11)*(z90.^2-z90)./(z90+(4/11));
z80=0.80*exp(i*theta);
w80=(7/11)*(z80.^2-z80)./(z80+(4/11));
z70=0.70*exp(i*theta);
w70=(7/11)*(z70.^2-z70)./(z70+(4/11));
z60=0.60*exp(i*theta);
w60=(7/11)*(z60.^2-z60)./(z60+(4/11));
z50=0.50*exp(i*theta);
w50=(7/11)*(z50.^2-z50)./(z50+(4/11));
z40=0.40*exp(i*theta);
w40=(7/11)*(z40.^2-z40)./(z40+(4/11));
z30=0.30*exp(i*theta);
w30=(7/11)*(z30.^2-z30)./(z30+(4/11));
z20=0.20*exp(i*theta);
w20=(7/11)*(z20.^2-z20)./(z20+(4/11));
z10=0.10*exp(i*theta);
w10=(7/11)*(z10.^2-z10)./(z10+(4/11));

figure(1)
clf
plot(real(w90),imag(w90))
hold on
    plot(rho*0,4*rho-2,'k')
    plot(4*rho-3,rho*0,'k')
hold off
axis([-2.5 0.5 -.4 .4])

t100p=linspace(-2.6362,2.6362,1001);
t100s=linspace(2.6362,2*pi-2.6362,1001);

z100p=1.00*exp(i*t100p);
z100s=1.00*exp(i*t100s);
w100p=(7/11)*(z100p.^2-z100p)./(z100p+(4/11));
w100s=(7/11)*(z100s.^2-z100s)./(z100s+(4/11));

t90p=linspace(-2.3212,2.3212,1001);
t90s=linspace(2.3212,2*pi-2.3212,1001);

z90p=0.90*exp(i*t90p);
z90s=0.90*exp(i*t90s);
w90p=(7/11)*(z90p.^2-z90p)./(z90p+(4/11));
w90s=(7/11)*(z90s.^2-z90s)./(z90s+(4/11));


t80p=linspace(-2.0658,2.0658,1001);
t80s=linspace(2.0658,2*pi-2.0658,1001);

z80p=0.80*exp(i*t80p);
z80s=0.80*exp(i*t80s);
w80p=(7/11)*(z80p.^2-z80p)./(z80p+(4/11));
w80s=(7/11)*(z80s.^2-z80s)./(z80s+(4/11));

t70p=linspace(-1.8216,1.8216,1001);
t70s=linspace(1.8216,2*pi-1.8216,1001);

z70p=0.70*exp(i*t70p);
z70s=0.70*exp(i*t70s);
w70p=(7/11)*(z70p.^2-z70p)./(z70p+(4/11));
w70s=(7/11)*(z70s.^2-z70s)./(z70s+(4/11));

t60p=linspace(-1.5625,1.5625,1001);
t60s=linspace(1.5625,2*pi-1.5625,1001);

z60p=0.60*exp(i*t60p);
z60s=0.60*exp(i*t60s);
w60p=(7/11)*(z60p.^2-z60p)./(z60p+(4/11));
w60s=(7/11)*(z60s.^2-z60s)./(z60s+(4/11));

t50p=linspace(-1.2530,1.2530,1001);
t50s=linspace(1.2530,2*pi-1.2530,1001);

z50p=0.50*exp(i*t50p);
z50s=0.50*exp(i*t50s);
w50p=(7/11)*(z50p.^2-z50p)./(z50p+(4/11));
w50s=(7/11)*(z50s.^2-z50s)./(z50s+(4/11));

t40p=linspace(-0.7954,0.7954,1001);
t40s=linspace(0.7954,2*pi-0.7954,1001);

z40p=0.40*exp(i*t40p);
z40s=0.40*exp(i*t40s);
w40p=(7/11)*(z40p.^2-z40p)./(z40p+(4/11));
w40s=(7/11)*(z40s.^2-z40s)./(z40s+(4/11));

t30p=linspace(0,0,1);
t30s=linspace(0,2*pi,1001);

z30p=0.30*exp(i*t30p);
z30s=0.30*exp(i*t30s);
w30p=(7/11)*(z30p.^2-z30p)./(z30p+(4/11));
w30s=(7/11)*(z30s.^2-z30s)./(z30s+(4/11));

t20p=linspace(0,0,1);
t20s=linspace(0,2*pi,1001);

z20p=0.20*exp(i*t20p);
z20s=0.20*exp(i*t20s);
w20p=(7/11)*(z20p.^2-z20p)./(z20p+(4/11));
w20s=(7/11)*(z20s.^2-z20s)./(z20s+(4/11));

t10p=linspace(0,0,1);
t10s=linspace(0,2*pi,1001);

z10p=0.10*exp(i*t10p);
z10s=0.10*exp(i*t10s);
w10p=(7/11)*(z10p.^2-z10p)./(z10p+(4/11));
w10s=(7/11)*(z10s.^2-z10s)./(z10s+(4/11));



Nw=101;
tvec=linspace(-pi,pi,Nt+1);
rhop=zeros(Nt,Nw);
rhos=zeros(Nt,Nw);
zrp=zeros(Nt,Nw);
zrs=zeros(Nt,Nw);
wrp=zeros(Nt,Nw);
wrs=zeros(Nt,Nw);

for m=1:length(tvec-1)
    if abs(tvec(m))<0.7954 
        rhomax=0.3;
    elseif abs(tvec(m))<1.253
        rhomax=0.4;
    elseif abs(tvec(m))<1.5625
        rhomax=0.5;
    elseif abs(tvec(m))<1.8216
        rhomax=0.6;
    elseif abs(tvec(m))<2.0658
        rhomax=0.7;
    elseif abs(tvec(m))<2.3213
        rhomax=0.8;
    elseif abs(tvec(m))<2.6362
        rhomax=0.9;
    else
        rhomax=1.0;
    end 
    
    rhos(m,:)=linspace(0,rhomax,Nw);
    if rhomax<0.8
        rhop(m,:)=linspace(rhomax+0.1,1,Nw);
    else
        rhop(m,:)=ones(1,Nw);
    end
    z=rhos(m,:)*exp(i*tvec(m));
    w=(7/11)*(z.^2-z)./(z+(4/11));
    zrs(m,:)=z;
    wrs(m,:)=w;
    z=rhop(m,:)*exp(i*tvec(m));
    w=(7/11)*(z.^2-z)./(z+(4/11));
    zrp(m,:)=z;
    wrp(m,:)=w;
end
        























figure(2)
clf
subplot(121)
plot(real(z100p),imag(z100p),'b')
hold on
    plot(real(z100s),imag(z100s),'r')
    plot(real(z90p),imag(z90p),'b')
    plot(real(z90s),imag(z90s),'r')
    plot(real(z80p),imag(z80p),'b')
    plot(real(z80s),imag(z80s),'r')
    plot(real(z70p),imag(z70p),'b')
    plot(real(z70s),imag(z70s),'r')
    plot(real(z60p),imag(z60p),'b')
    plot(real(z60s),imag(z60s),'r')
    plot(real(z50p),imag(z50p),'b')
    plot(real(z50s),imag(z50s),'r')
    plot(real(z40p),imag(z40p),'b')
    plot(real(z40s),imag(z40s),'r')
    plot(real(z30p),imag(z30p),'b')
    plot(real(z30s),imag(z30s),'r')
    plot(real(z20p),imag(z20p),'b')
    plot(real(z20s),imag(z20s),'r')
    plot(real(z10p),imag(z10p),'b')
    plot(real(z10s),imag(z10s),'r')
hold off
axis square
subplot(122)
plot(real(w100p),imag(w100p),'b')
hold on
    plot(real(w100s),imag(w100s),'r')
    plot(real(w90p),imag(w90p),'b')
    plot(real(w90s),imag(w90s),'r')
    plot(real(w80p),imag(w80p),'b')
    plot(real(w80s),imag(w80s),'r')
    plot(real(w70p),imag(w70p),'b')
    plot(real(w70s),imag(w70s),'r')
    plot(real(w60p),imag(w60p),'b')
    plot(real(w60s),imag(w60s),'r')
    plot(real(w50p),imag(w50p),'b')
    plot(real(w50s),imag(w50s),'r')
    plot(real(w40p),imag(w40p),'b')
    plot(real(w40s),imag(w40s),'r')
    plot(real(w30p),imag(w30p),'b')
    plot(real(w30s),imag(w30s),'r')
    plot(real(w20p),imag(w20p),'b')
    plot(real(w20s),imag(w20s),'r')
    plot(real(w10p),imag(w10p),'b')
    plot(real(w10s),imag(w10s),'r')
hold off
axis square

figure(3)
clf
subplot(122)
plot(real(w100p),imag(w100p),'b')
hold on
    plot(real(w90p),imag(w90p),'b')
    plot(real(w80p),imag(w80p),'b')
    plot(real(w70p),imag(w70p),'b')
    plot(real(w60p),imag(w60p),'b')
    plot(real(w50p),imag(w50p),'b')
    plot(real(w40p),imag(w40p),'b')
    plot(real(w30p),imag(w30p),'b')
    plot(real(w20p),imag(w20p),'b')
    plot(real(w10p),imag(w10p),'b')
    for m=1:Nt
        plot(real(wrp(m,:)),imag(wrp(m,:)),'b')
    end
hold off
axis([-2.5 0.5 -.4 .4])
subplot(121)
plot(real(w100s),imag(w100s),'b')
hold on
    plot(real(w90s),imag(w90s),'b')
    plot(real(w80s),imag(w80s),'b')
    plot(real(w70s),imag(w70s),'b')
    plot(real(w60s),imag(w60s),'b')
    plot(real(w50s),imag(w50s),'b')
    plot(real(w40s),imag(w40s),'b')
    plot(real(w30s),imag(w30s),'b')
    plot(real(w20s),imag(w20s),'b')
    plot(real(w10s),imag(w10s),'b')
     for m=1:Nt
        plot(real(wrs(m,:)),imag(wrs(m,:)),'b')
    end
hold off
pause
axis([-2.5 0.5 -.4 .4])


figure(4)
plot(real(w100),imag(w100))
hold on
    plot(rho*0,4*rho-2,'k')
    plot(4*rho-3,rho*0,'k')
hold off
axis([-2.5 0.5 -.4 .4])

figure(5)
clf
subplot(121)
plot(real(z100p),imag(z100p),'b')
hold on
    plot(real(z100s),imag(z100s),'r')
    plot(real(z90p),imag(z90p),'b')
    plot(real(z90s),imag(z90s),'r')
    plot(real(z80p),imag(z80p),'b')
    plot(real(z80s),imag(z80s),'r')
    plot(real(z70p),imag(z70p),'b')
    plot(real(z70s),imag(z70s),'r')
    plot(real(z60p),imag(z60p),'b')
    plot(real(z60s),imag(z60s),'r')
    plot(real(z50p),imag(z50p),'b')
    plot(real(z50s),imag(z50s),'r')
    plot(real(z40p),imag(z40p),'b')
    plot(real(z40s),imag(z40s),'r')
    plot(real(z30p),imag(z30p),'b')
    plot(real(z30s),imag(z30s),'r')
    plot(real(z20p),imag(z20p),'b')
    plot(real(z20s),imag(z20s),'r')
    plot(real(z10p),imag(z10p),'b')
    plot(real(z10s),imag(z10s),'r')
    for m=1:Nt
        plot(real(zrs(m,:)),imag(zrs(m,:)),'r')
        plot(real(zrp(m,:)),imag(zrp(m,:)),'b')
    end
hold off
axis square
subplot(122)
plot(real(w100p),imag(w100p),'b')
hold on
    plot(real(w100s),imag(w100s),'r')
    plot(real(w90p),imag(w90p),'b')
    plot(real(w90s),imag(w90s),'r')
    plot(real(w80p),imag(w80p),'b')
    plot(real(w80s),imag(w80s),'r')
    plot(real(w70p),imag(w70p),'b')
    plot(real(w70s),imag(w70s),'r')
    plot(real(w60p),imag(w60p),'b')
    plot(real(w60s),imag(w60s),'r')
    plot(real(w50p),imag(w50p),'b')
    plot(real(w50s),imag(w50s),'r')
    plot(real(w40p),imag(w40p),'b')
    plot(real(w40s),imag(w40s),'r')
    plot(real(w30p),imag(w30p),'b')
    plot(real(w30s),imag(w30s),'r')
    plot(real(w20p),imag(w20p),'b')
    plot(real(w20s),imag(w20s),'r')
    plot(real(w10p),imag(w10p),'b')
    plot(real(w10s),imag(w10s),'r')
        for m=1:Nt
        plot(real(wrs(m,:)),imag(wrs(m,:)),'r')
        plot(real(wrp(m,:)),imag(wrp(m,:)),'b')
    end
hold off
axis([-2.5 0.5 -.4 .4])
axis square
