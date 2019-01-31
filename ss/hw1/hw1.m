% Matt McDade
% System Simulation HW 1

x = zeros(100);
x(1) = 0.11;

alphaVals = [0.80; 1.35; 2.75; 3.20; 3.52; 3.69; 4.0];

hold on
for i = 1:numel(alphaVals)
    for j = 2:100
        x(j) = alphaVals(i) * (1 - x(j-1)) * x(j-1);
    end
    plot(linspace(1, 100), x)
    xlabel('k'); ylabel('x(k)');
    legend('a = 0.80','a = 1.35','a = 2.75','a = 3.20','a = 3.52','a = 3.69','a = 4.0');
end
hold off