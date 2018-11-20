H = tf([0 0 1], [1 sqrt(2) 1]);
H1 = tf([1 2 1],[1 -1.75 0.8672])
H2 = tf([1 2 -1],[1 -1.75 0.875])
H12diff = H1 - H2
Htustin = c2d(H, 0.001, 'tustin');
Hexact = c2d(H, 0.001, 'foh');

Hdiff = Hexact - Htustin;


figure(1)
bode(Htustin)

figure(2)
bode(Hexact)