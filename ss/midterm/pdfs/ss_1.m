

N=10001;
t=linspace(0,10,N);
T=t(2)-t(1);

u=zeros(1,N);
y=zeros(1,N);

u=exp(-t).*cos(t);
y(1)=0;



for k=1:N-1
    y(k+1) = (1-2*T)*y(k)+2*T*u(k);
end

plot(t,y)
xlabel('t')
ylabel('y')
