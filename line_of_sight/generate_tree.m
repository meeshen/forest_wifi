function tree = generate_tree(area, tree_diameter)
% generates a tree in given area and diameter

x = rand*area(1);
y = rand*area(2);
d = normrnd(tree_diameter, tree_diameter*0.1);
tree = [x y d];