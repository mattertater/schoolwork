% Matt McDade
% ANM 2 
% Homework 6 Problem A

% classic scheme:  c2(i) = u_i^{n+1}  c1(i) = u_i^n
% richardson:      r2(i) = u_i^{n+1}  r1(i) = u_i^n  r0(i) = u_i^{n-1}

% First try .08 to see classical blows up too because rt = 1.25
% then try alpha = .8 so rt = .125
alpha = .8;
r = .1;
dx = .01;
dt = r*dx^2;
x = 0:dx:1;
N = length(x);
cl = zeros(N,2);
ri = zeros(N,3);

% initial condition
% cl(i,n) = classic
% ri(i,n) = richardson

cl(:,1) = sin(5*pi*x);
figure(15)
plot(x,cl(:,1),'k',x,ri(:,1),'r'),legend('Classic','Richardson'),axis([0 1 -1 1])
pause

cl(1,2) = 0;
cl(N,2) = 0;
for i=2:N-1
  cl(i,2) = cl(i,1) + (r/alpha)*(cl(i-1,1)-2*cl(i,1)+cl(i+1,1));
end
ri(1,3) = 0;
ri(N,3) = 0;
for i=2:N-1
  ri(i,3) = ri(i,1) + 2*(r/alpha)*(ri(i-1,2)-2*ri(i,2)+ri(i+1,2));
end
plot(x,cl(:,2),'k',x,ri(:,3),'r'),legend('Classic','Richardson'),axis([0 1 -1 1])


cl(:,1) = cl(:,2);
ri(:,1) = ri(:,2);
ri(:,2) = ri(:,3);