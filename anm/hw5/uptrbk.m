function X = uptrbk(A,B)

%UPTRBK   Upper-triangularization followed by back substitution.
%         Partial pivoting is used.
% Sample call
%   X = uptrbk(A,B)
% Inputs
%   A   coefficient matrix
%   B   right hand side vector
% Return
%   X   solution vector

N = length(B);
Aug = [A B]; % Augmented matrix

for p = 1:N-1
   % partial pivoting
   p
  [~, j] = max(abs(Aug(p:N,p)));  % Find the pivot row. with ~ ignores the first output
  % Interchange rows p and j+p-1
  C = Aug(p,p:N+1);
  Aug(p,p:N+1)=Aug(j+p-1,p:N+1);
  Aug(j+p-1,p:N+1)= C;
  if  A(p,p) == 0, break, end
  % create zeros below diagonal
  for k = p+1:N
    mkp = Aug(k,p)/Aug(p,p);
    Aug(k,p:N+1) = Aug(k,p:N+1) - mkp*Aug(p,p:N+1);
  end
end

X = backsub(Aug(:,1:N),Aug(:,N+1));
