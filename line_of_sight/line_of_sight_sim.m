clear all, clf

rng(123)

% area in cm, trx placed on opposite sides of x-axis
area = [100 10]; % x, y

% trees parameters
tree_density = [600 1000]; % 1st thinning = 600-1000, 2nd = 1500-2000
tree_diameter = 0.2; % 1st thinning = 0.1, 2nd = 0.2

% generate a "sensible" number of trees for the area
tree_number = round(randi(tree_density)*area(1)*area(2)/10000);

% generate trees and put them in an occupancy grid
trees = zeros(tree_number,3);
occupancy_grid = zeros(area(1),area(2));
for i=1:tree_number
    col = 1;
    while(col)
        % generate tree: position and diameter
        tree = generate_tree(area,tree_diameter);

        % test for collisions with previous trees
        col = tree_collision(tree,trees,i);
    end
    trees(i,:) = tree;
    %occupied_points = 
    
    
end

% generate TRx
Tx = generate_transceiver(-2,area(2)/2-1,2,100);
Rx = generate_transceiver(area(1)+0.5,area(2)/2-0.5,1,100);

hold on, axis equal
viscircles(trees(:,1:2), trees(:,3), 'Color', 'g');
plot(Tx(1,:),Tx(2,:),'r')
plot(Rx(1,:),Rx(2,:),'r')