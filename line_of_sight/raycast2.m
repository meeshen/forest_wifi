function no_col = raycast2(x1,y1,x2,y2, trees)
% checks if there are any trees between points Tx and Rx
% ugly code - optimized for performance
no_col = 0;
for i=1:length(trees)
    if ((y2-y1)*trees(i,1) - (x2-x1)*trees(i,2) + x2*y1-y2*x1)^2/((y2-y1)^2+(x2-x1)^2) < trees(i,3)^2
        return;
    end
end
no_col = 1;