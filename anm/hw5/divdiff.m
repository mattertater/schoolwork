function C = divdiff(X,Y)

m = length(X);
D = zeros(m,m);
D(:,1) = Y';
for j=2:m
   for k=j:m
      D(k,j) = (D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1));
   end
end

C = diag(D);
