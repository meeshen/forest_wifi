function collision = tree_collision(tree,trees,length)
% collisions between the new tree and trees that already exist and TRx
collision = 0;

if length>1
    for i=1:length
        dist = (tree(1)-trees(i,1))^2 + (tree(2)-trees(i,2))^2;
        if sqrt(dist) < tree(3)+trees(i,3)
            collision = 1;
            break;
        end
    end
end