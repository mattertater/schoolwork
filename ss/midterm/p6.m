% Matt McDade
% System Simulation 
% Midterm Exam Problem 6

close all; clc;

% Different Values of epsilon
eps=[6,8.53,10];
T=0.01;

t0plot=0;
tfinal=40;
t=[0:T:tfinal];
N=length(t);
k0=1+floor(t0plot/T);

xp=zeros(2,N+1);
fp=xp;
fc=xp;

xc(:,1)=[0 1]';
xp(:,1)=xc(:,1);

% Forcing Function
u = @(t) 1.2*cos((2*pi*t)./10);

xpo=xp;
fpo=fp;

% loop 3 times for values of epsilon
for i=1:3
    for k=1:N-1
        
        % AB2
        %P
        xp(:,k+1)=xc(:,k)+T*((3/2)*fp(:,k) - (1/2)*fp(:,k));

        %E
        fp(1,k+1)=xp(2,k+1);
        fp(2,k+1)=eps(i)*(1-(xp(1,k+1))^2)*xp(2,k+1)-xp(1,k+1)+u(k);

        %C
        xc(:,k+1)=xc(:,k)+T*((3/2)*fp(:,k+1) - (1/2)*fp(:,k+1));

        %E
        fc(1,k+1)=xc(2,k+1);
        fc(2,k+1)=eps(i)*(1-(xc(1,k+1))^2)*xc(2,k+1)-xc(1,k+1)+u(k);  
    end

    figure(i)
    clear title xlabel ylabel
    plot(xp(1,k0:N),xp(2,k0:N),'--')
    hold on
        plot(xc(1,k0:N),xc(2,k0:N),'-')
    hold off
    xlabel('x_1')
    ylabel('x_2')
    legend('Prediction', 'Correction')
    title(['Van Der Pol System Phase Plot with eps = ', num2str(eps(i))])
end
disp('The greater the epsilon value, the further away the prediction becomes from the correction. The ducky is also elongated vertically as the eps value increases, but not horizontally at all. ')
disp('Going back and removing the u(k) forcing function from the equations doesnt show much if any difference in the graphs, making me think Im missing something')