% Matt McDade
% System Simulation
% Project - Weirstrass Integral Visualization
% Plotting 3 values of a against each other
close all; clear; clc;

% Detail of Weierstrass graphs - 0.01 takes about 400s on my laptop
delta = 0.01;

x = -2:delta:2;
b = 0:0.01:5;
a = 0.4; a2 = 0.1; a3 = 0.7;

y = zeros(length(x),5);
y2 = zeros(length(x),5);
y3 = zeros(length(x),5);

[row, col] = size(y);
arya = zeros(size(b));
arya2 = zeros(size(b));
arya3 = zeros(size(b));
Y = zeros(size(x));
Y2 = zeros(size(x));
Y3 = zeros(size(x));

for h = 1:length(b)
    for i = 1:length(x)
        for j = 1:col
            % Weierstrass function
            rest = cos((b(h)^(j-1))*pi*x(i));
            y(i,j) = (a^(j-1))*rest;
            y2(i,j) = (a2^(j-1))*rest;
            y3(i,j) = (a3^(j-1))*rest;
        end
        Y(i) = sum(y(i,:));
        Y2(i) = sum(y2(i,:));
        Y3(i) = sum(y3(i,:));
    end
    
    % Plot integral of Weierstrass function
    subplot(211)
    plot(x, Y2, x, Y, x, Y3)
    legend('a = 0.1','a = 0.4','a = 0.7')
    axis([-2 2 -4 4])
    title(['Weierstrass with b = ', num2str(b(h))])
    
    % Plot graph of definite integral over [-2 2]
    arya(h) = trapz(x, Y);
    arya2(h) = trapz(x, Y2);
    arya3(h) = trapz(x, Y3);
    subplot(212)
    plot(b, arya2, b, arya, b, arya3)
    legend('a = 0.1','a = 0.4','a = 0.7')
    axis([0 5 -5 5])
    title('Integral As b Value Changes')
    ylabel('Area'); xlabel('b'); 
    drawnow
    
end