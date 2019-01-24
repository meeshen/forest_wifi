function no_col = raycast(Tx, Rx, trees)
% checks if there are any trees between points Tx and Rx
% ugly code - optimized for performance
no_col = 0;
for i=1:length(trees)
    if ((Rx(2)-Tx(2))*trees(i,1) - (Rx(1)-Tx(1))*trees(i,2) + Rx(1)*Tx(2)-Rx(2)*Tx(1))^2/((Rx(2)-Tx(2))^2+(Rx(1)-Tx(1))^2) < trees(i,3)^2
        return
    end
end
no_col = 1;