syms aa(x) bb(x)
 
aa(x) = 1./(1+x.^2);
bb(x) = x.^3 - 3 * x.^2 + 2;
aa_2 = diff(aa, 4);
bb_2 = diff(bb, 4);
intervals = 10;
 
for i=1:5
    aa_h = (2 - 0) ./ intervals;
    bb_h = (4 - 1) ./ intervals;
    Est_aa(i) = -1/180 * aa_2(0) * (2 - 0) * aa_h.^4;
    Est_bb(i) = -1/180 * bb_2(1) * (4 - 1) * bb_h.^4;
    intervals = intervals * 2;
end
 
disp(Est_aa)
disp(Est_bb)