function []  = translationLayer(name,bbox,ratio)

shape_datas = shaperead(name);

shape_counts = length(shape_datas);
dx = bbox(1) * ratio;
dy = bbox(2) * ratio;

% 构建平移矩阵
M = [1, 0, -dx; 0, 1, -dy; 0,0,1];

for i = 1 : 1 :shape_counts
    xyz = [];
    x = shape_datas(i).X;
    y = shape_datas(i).Y;
    % 构建齐次坐标点对
    xyz(1,:) = x;
    xyz(2,:) = y;
    xyz(3,:) = 1;
    
    % 对图形按比率平移
    xy_M = M * xyz;
    
    % 将旋转后坐标赋值
    shape_datas(i).X = xy_M(1,:);
    shape_datas(i).Y = xy_M(2,:);
end
shapewrite(shape_datas,name);
end