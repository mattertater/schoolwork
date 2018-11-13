function [polelocdel,M]=fixed_point_delta_form_pole_locations(n,f,deltat)
%FIXED_POINT_POLES_LOCATIONS  Determine stable pole locations for a
%fixed-point representation scheme using direct form I/II implementation.
%
%fixed_point_delta_form_pole_locations(n,f,deltat) determines and plots all 
%the possible pole locations for a second-order filter  implemented using a 
%Delta Form implementation whose coefficients are represented in 
%the [n,-f] fixed-point representation with a sampling time deltat.
%
%Jay L. Adams 2016


%CREATE THE SET OF ALL NUMBERS WITH A [n,-f] FIXED POINT REPRESENTATION
N=linspace(-(2^(n-1)),(2^(n-1))-1,2^n);
M=N/(2^f);
polelocdel=zeros(2,length(M)*length(M));
%----------------------------------------

%DETERMINE ALL SINGULARITES FOR (z-1)/deltat POLYNOMIAL
figure(1)
clf
Mlen=length(M);
for m=1:Mlen
    a1=M(m);
    for k=1:Mlen
        a0=M(k);
        polelocdel(1,(m-1)*Mlen+k)=(-a1+sqrt(a1*a1-4*a0))/2;
        polelocdel(2,(m-1)*Mlen+k)=(-a1-sqrt(a1*a1-4*a0))/2;
    end
end

plot(real(polelocdel(1,:)'),imag(polelocdel(1,:)'),'.')
hold on
plot(real(polelocdel(2,:)'),imag(polelocdel(2,:)'),'.')
hold off
axis([-3 3 -3 3])
axis square
tstring=['Possible "\delta Pole"  Locations Using the [',num2str(n),',-',num2str(f),'] Fixed-Point Representation Scheme and Delta Operator Implementation'];
%title(tstring)

%SET UP THE FIGURE WITH STABILITY BOUNDARY
figure(2)
c=exp(i*linspace(0,2*pi,10001));
plot(real(c),imag(c))
%-----------------------------------------
polelocz=polelocdel*deltat+1;

hold on
plot(real(polelocz(1,:)'),imag(polelocz(1,:)'),'.')
plot(real(polelocz(2,:)'),imag(polelocz(2,:)'),'.')

hold off

tstring=['Possible Pole Locations Using the [',num2str(n),',-',num2str(f),'] Fixed-Point Representation Scheme and Delta Operator Implementation (\Delta t=',num2str(deltat),')'];
%title(tstring)
axis square