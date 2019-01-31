% Matt McDade
% System Simulation HW 2
% Not sure what all else you're looking for on this one, this definitely
% isn't everything

H_approx = tf([0 -50 50*33.3333 50*13333.3], [1 185.333 12133.3 693333]);

figure(1); bode(H_approx)
figure(2); impulse(H_approx)
figure(3); step(H_approx)