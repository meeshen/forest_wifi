function points = generate_transceiver(x,y,size,resolution)
% returns an array of points for a rectangular transceiver
% resolution is points-per-side

xmin = x;
ymin = y;
xmax = xmin+size;
ymax = ymin+size;

side1 = [linspace(xmin,xmax,resolution+1); ymin*ones(1,resolution+1)];
side2 = [xmax*ones(1,resolution+1); linspace(ymin,ymax,resolution+1)];
side3 = [linspace(xmax,xmin,resolution+1); ymax*ones(1,resolution+1)];
side4 = [xmin*ones(1,resolution+1); linspace(ymax,ymin,resolution+1)];

points = [side1 side2 side3 side4];