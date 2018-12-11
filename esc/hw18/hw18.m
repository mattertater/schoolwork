clc;
clear all;

w = 80;
r_1 = .8:.0001:1;
r_2 = .6:.0001:1;
g_r1 = cos(w*log(r_1));
g_r2 = cos(w*log(r_2));

x = [.800 .803 .815 .828 .841 .855 .868 .882 .896 .910 .924 .939 .954 .969 .984 1];
y = cos(w*log(x));
splines = spline(x, y);

figure(1)
plot(x,y,'o',r_1,ppval(splines,r_1),'r-', r_1, g_r1, 'g-')
legend('Data Points','Splines','Original Function')

figure(2)
plot(x,y,'o',r_2,ppval(splines,r_2),'r-', r_2, g_r2, 'g-');
legend('Data Points','Splines','Original Function')