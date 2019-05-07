% Matt McDade
% System Simulation
% Project - Weirstrass Integral Visualization
close all; clear; clc;

% Detail of Weierstrass graphs - 0.001 takes about 80s on my laptop
delta = 0.001;

x = -2:delta:2;
b = 0:0.01:5;
a = 0.4;

y = zeros(length(x),5);
[row, col] = size(y);
arya = zeros(size(b));
Y = zeros(size(x));

for h = 1:length(b)
    for i = 1:length(x)
        for j = 1:col
            % Weierstrass function
            y(i,j) = (a^(j-1))*cos((b(h)^(j-1))*pi*x(i));
        end
        Y(i) = sum(y(i,:));
    end
    
    % Plot integral of Weierstrass function
    subplot(211)
    area(x, Y)
    axis([-2 2 -2 2])
    title(['Weierstrass with b = ', num2str(b(h))])
    
    % Plot graph of definite integral over [-2 2]
    arya(h) = trapz(x, Y);
    subplot(212)
    plot(b, arya)
    axis([0 5 -3 3])
    title('Integral As b Value Changes')
    ylabel('Area'); xlabel('b'); 
    drawnow
    
end