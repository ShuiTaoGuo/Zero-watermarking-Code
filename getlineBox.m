function [boundingbox] = getlineBox(name)

% 读取线数据
line_data = shaperead(name);
line_x_min = 99999999999;
line_x_max = -9999999999;
line_y_min = 99999999999;
line_y_max = -9999999999;
for i = 1:1:length(line_data)
    bbox = line_data(i).BoundingBox;
    if line_x_min > bbox(1)
        line_x_min = bbox(1);
    end
    if line_x_max < bbox(2)
        line_x_max = bbox(2);
    end
    if line_y_min > bbox(3)
        line_y_min = bbox(3);
    end
    if line_y_max < bbox(4)
        line_y_max = bbox(4);
    end
end

boundingbox = [line_x_min,line_x_max,line_y_min,line_y_max];


end