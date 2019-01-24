function tree = generate_tree(area, tree_diameter)
% generates a tree in given area and diameter

x = randi([1 area(1)]);
y = randi([1 area(2)]);
d = normrnd(tree_diameter, tree_diameter*0.1);
tree = [x y d];