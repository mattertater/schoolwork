function [M_app]=fixed_point_approximation_rnd(M,n,f)
% FIXED_POINT_APPROXIMATION Find a fixed-point representation
% [M_app]=fixed_point_approximation_rnd(M,n,f) finds a round-off approximation
% to M in the [n,-f] fixed-point two's complement representation scheme.
%
% Jay L. Adams 2016

x=round(M*2^f);
if((x>2^(n-1)-1)||(x<-(2^(n-1))))
    M_app=NaN;
else
    M_app=x/(2^f);
end

