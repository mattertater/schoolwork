filename = 'c-18.mat';
vars = {'A', 'b'};

data = load(filename);

A = data.Problem.A;
b = data.Problem.b;

spparms('spumoni',2)
tic
reg = (A\b);
% a = bicg(A, b, 1e-10, 100000);
toc