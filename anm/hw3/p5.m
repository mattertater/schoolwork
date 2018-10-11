A = ones(9, 9);
C = ones(9, 9);

for j = 1:9
     C(j, j) = 10;
end

for j = 1:9
    A(j, j) = 1.01;
end
B = (1:9)';

x1 = A\B;
y1 = C\B;

condAPre = cond(A)
condCPre = cond(C)

A(5, 3) = A(5, 3) * 1.02;
C(5, 3) = C(5, 3) * 1.02;

x2 = A\B;
y2 = C\B;

% fprintf('\tx1(j)\t\tx2(j)\n')
% fprintf('\ty1(j)\t\ty2(j)\n')
for j = 1:9
    diffX = abs(x1(j) - x2(j));
    diffY = abs(y1(j) - y2(j));
    % fprintf('abs(%0.4f - %0.4f) = %.4f\n', x1(j), x2(j), abs(x1(j) - x2(j)))
    % fprintf('abs(%0.4f - %0.4f) = %.4f\n', y1(j), y2(j), abs(y1(j) - y2(j)))
end

percChangeX = norm(x1-x2)/norm(x1)
condA = cond(A)

percChangeY = norm(y1-y2)/norm(y1)
condC = cond(C)