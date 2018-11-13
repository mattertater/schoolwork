function [pole_imag,pole_real]=fixed_point_coupled_form_pole_locations(n,f)
%FIXED_POINT_COUPLED_FORM_POLES_LOCATIONS  Determine stable pole locations for a
%fixed-point representation scheme using coupled form implementation.
%
%FIXED_POINT_COUPLED_FORM_POLE_LOCATIONS(n,f) determines and plots all the possible
%stable pole locations for a second-order filter  implemented using a 
%Coupled Form implementation whose coefficients are represented in 
%the [n,-f] fixed-point representation.
%
%Jay L. Adams 2016


%CREATE THE SET OF ALL NUMBERS WITH A [n,-f] FIXED POINT REPRESENTATION
M=linspace(-(2^(n-1)),(2^(n-1))-1,2^n);
Nposs=M/(2^f);
%----------------------------------------


%RESTRICT TO ONLY NON_NEGATIVE NUMBERS SMALLER THAN ONE
kmin=1;
kmax=1;
for(k=1:length(Nposs))
    if(Nposs(k)<0)
        kmin=k+1;
    end
    if(Nposs(k)<1)
        kmax=k;
    end
end
N=Nposs(kmin:kmax)



%CALCULATE THE POSSIBLE REAL PARTS
pole_real=N;
%CALCULATE THE POSSIBLE IMAGINARY PARTS
pole_imag=N;


%SET UP THE FIGURE WITH STABILITY BOUNDARY
figure(2)
c=exp(i*linspace(0,2*pi,10001));
plot(real(c),imag(c))
%-----------------------------------------

%USING THE REAL AND IMAGINARY PARTS DETERMINE IF THE POLE IS IN THE UNIT
%DISC
for(k=1:length(N))
    k
    plot_real=pole_real;
    plot_imag=pole_imag(k)*ones(size(plot_real));
    for(el=1:length(plot_imag))
        
        if(abs(plot_real(el)+i*plot_imag(el))>1)    %If the pole is outside 
            plot_imag(el)=0;                        %the circle |z|=1 , 
            plot_real(el)=0;                        %plot 0 instead
        end                               
    end
    hold on
    plot(plot_real,plot_imag,'.')
    plot(plot_real,-plot_imag,'.')
    hold off
    axis square
    xlabel('Re\{z\}')
    ylabel('Im\{z\}')
end
tstring=['Possible Pole Locations Using the [',num2str(n),',-',num2str(f),'] Fixed-Point Representation Scheme and Coupled Form  Implementation'];
pause
axis([0 1 0 1])
xlabel('Re\{z\}')
ylabel('Im\{z\}')
%title(tstring)