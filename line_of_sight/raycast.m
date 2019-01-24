function no_col = raycast(Tx, Rx, trees)

x1 = Tx(1);
x2 = Rx(1);
y1 = Tx(2);
y2 = Rx(2);

p1 = y2-y1;
p2 = x2-x1;
p3 = x2*y1-y2*x1;
p4 = 1.1*sqrt( (y2-y1)^2 + (x2-x1) ^2 );

tree_num = length(trees);

no_col = 1;
for i=1:tree_num
    x0 = trees(i,1);
    y0 = trees(i,2);
    d0 = trees(i,3);
    dist = abs(p1*x0 - p2*y0 + p3)/p4;
    if dist<d0
        no_col=0;
        return;
    end
end