clear all
% area in cm, trx placed on opposite sides of x-axis
area = [100 2]; % x, y

% trees parameters
tree_density = [1500 2000]; % 1st thinning = 1500-2000, 2nd = 600-1000
tree_diameter = 0.1; % 1st thinning = 0.1, 2nd = 0.2

% generate TRx
resolution = 100;


successes = zeros(5,2);

%profile on
rng('Shuffle')
for aaa=1:5
    area(1) = aaa*100;
    Tx = generate_transceiver(-2,area(2)/2-1,2,resolution);
    Rx = generate_transceiver(area(1)+0.5,area(2)/2-0.5,1,resolution);
    success = 0;
    for k=1:10000
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

        % raycast
        break_outer = 0;
        for i=resolution+1:resolution*2
            for j=1:resolution*3
                if raycast2(Tx(i,1),Tx(i,2),Rx(j,1),Rx(j,2), trees)
                    success = success+1;
                    break_outer = 1;
                    break;
                end
            end
            if break_outer==1
                break;
            end
        end
        [aaa k success]
    end
    successes(aaa,:) = [area(1) success];
end

%profile viewer