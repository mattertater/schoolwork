function [pole_mag,pole_real]=fixed_point_direct_form_pole_locations(n,f)
%FIXED_POINT_POLES_LOCATIONS  Determine stable pole locations for a
%fixed-point representation scheme using direct form I/II implementation.
%
%FIXED_POINT_POLE_LOCATIONS(n,f) determines and plots all the possible
%stable pole locations for a second-order filter  implemented using a 
%Direct Form I/II implementation whose coefficients are represented in 
%the [n,-f] fixed-point representation.
%
%Jay L. Adams 2016


%CREATE THE SET OF ALL NUMBERS WITH A [n,-f] FIXED POINT REPRESENTATION
M=linspace(-(2^(n-1)),(2^(n-1))-1,2^n);
N=M/(2^f);
%----------------------------------------

%CALCULATE THE POSSIBLE MAGNITUDES
poss_mag=sqrt(N(2^(n-1)+2:2^n));
%DETERMINE WHICH MAGNITUDES ARE (STRICTLY) LESS THAN UNITY
Nmag=0;
for(k=1:length(poss_mag))
    if(poss_mag(k)<1)
        Nmag=k;
    end
end
Nmag;
%KEEP ONLY THE MAGNITUDES LESS THAN UNITY
pole_mag=poss_mag(1:Nmag);
%---------------------------------------

%CALCULATE THE POSSIBLE REAL PARTS
pole_real=N/2;

%SET UP THE FIGURE WITH STABILITY BOUNDARY
figure(1)
c=exp(i*linspace(0,2*pi,10001));
plot(real(c),imag(c),'--')
%-----------------------------------------

%USING THE REAL PART AND MAGNITUDES CALCULATE THE POSSIBLE IMAGINARY PARTS
for(k=1:Nmag)
    plot_real=pole_real;
    pole_imag=sqrt((pole_mag(k)^2)-pole_real.^2);
    for(el=1:length(pole_imag))
        if((abs(imag(pole_imag(el))))>0)  %If pole_imag(el) is not real, then
            pole_imag(el)=0;              %the circle |z|=pole_mag(k) and
            plot_real(el)=0;              %the line Re{z}=pole_real(el) do
        end                               %not cross, so plot 0 instead
    end

    hold on
    plot(plot_real,pole_imag,'.')
    plot(plot_real,-pole_imag,'.')
    hold off
    axis square
    xlabel('Re\{z\}')
    ylabel('Im\{z\}')
end
tstring=['Possible Pole Locations Using the [',num2str(n),',-',num2str(f),'] Fixed-Point Representation Scheme and Direct Form I/II Implementation'];
%pause
axis([0 1 0 1])
title(tstring)