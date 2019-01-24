clear all, clf

rng('Shuffle')

% area in cm, trx placed on opposite sides of x-axis
area = [200 10]; % x, y

% trees parameters
tree_density = [600 1000]; % 1st thinning = 1500-2000, 2nd = 600-1000
tree_diameter = 0.2; % 1st thinning = 0.1, 2nd = 0.2

% generate a "sensible" number of trees for the area
tree_number = round(randi(tree_density)*area(1)*area(2)/10000);

% generate trees
trees = zeros(tree_number,3);
for i=1:tree_number
    col = 1;
    while(col)
        % generate tree: position and diameter
        tree = generate_tree(area,tree_diameter);

        % test for collisions with previous trees
        col = tree_collision(tree,trees,i);
    end
    trees(i,:) = tree;    
end

% generate TRx
resolution = 100;
Tx = generate_transceiver(-2,area(2)/2-1,2,resolution);
Rx = generate_transceiver(area(1)+0.5,area(2)/2-0.5,1,resolution);

raycasts = [];
% raycast
for i=1:resolution*4
    for j=1:resolution*4
        if raycast(Tx(i,:),Rx(j,:), trees)
            raycasts = [raycasts; Tx(i,:) Rx(j,:)];
        end
    end
end

hold on, axis equal
viscircles(trees(:,1:2), trees(:,3), 'Color', 'g');
plot(Tx(:,1),Tx(:,2),'r')
plot(Rx(:,1),Rx(:,2),'r')

if length(raycasts)>0
    i = randi([1 length(raycasts)]);
    x = [raycasts(i,1) raycasts(i,3)];
    y = [raycasts(i,2) raycasts(i,4)];
    plot(x,y,'b');
end