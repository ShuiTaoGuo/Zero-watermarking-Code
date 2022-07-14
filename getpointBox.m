function [boundingbox] = getpointBox(name)

point_data = shaperead(name);
point_x = [];
point_y = [];
for i = 1:1:length(point_data)
    point_x = [point_x,point_data(i).X];
    point_y = [point_y,point_data(i).Y];
end
point_x_min = min(point_x);
point_x_max = max(point_x);
point_y_min = min(point_y);
point_y_max = max(point_y);

boundingbox = [point_x_min,point_x_max,point_y_min,point_y_max];


end