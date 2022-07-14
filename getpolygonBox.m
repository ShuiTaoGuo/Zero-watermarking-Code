function [boundingbox] = getpolygonBox(name)
% 读取面数据
gon_data = shaperead(name);
gon_x_min = 99999999999;
gon_x_max = -9999999999;
gon_y_min = 99999999999;
gon_y_max = -9999999999;
for i = 1:1:length(gon_data)
    bbox = gon_data(i).BoundingBox;
    if gon_x_min > bbox(1)
        gon_x_min = bbox(1);
    end
    if gon_x_max < bbox(2)
        gon_x_max = bbox(2);
    end
    if gon_y_min > bbox(3)
        gon_y_min = bbox(3);
    end
    if gon_y_max < bbox(4)
        gon_y_max = bbox(4);
    end
end

boundingbox = [gon_x_min,gon_x_max,gon_y_min,gon_y_max];

end