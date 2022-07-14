function [] = scaleLayer(name,point,ratio)

shape_datas = shaperead(name);

shape_counts = length(shape_datas);
% 角度
a = theta / 180 * pi;
% 构建平移矩阵
M = [1, 0, -point(1); 0, 1, -point(2); 0,0,1];
% 构建缩放矩阵
S = [ratio, 0, 0; 0, ratio, 0; 0,0,1];

for i = 1 : 1 :shape_counts
    xyz = [];
    x = shape_datas(i).X;
    y = shape_datas(i).Y;
    % 构建齐次坐标点对
    xyz(1,:) = x;
    xyz(2,:) = y;
    xyz(3,:) = 1;
    
    % 对图形中心先平移至原点
    xy_M = M * xyz;
    % 围绕原点做旋转
    xy_S = S * xy_M;
    % 反平移至原始位置
    xy_MS = M \ xy_S;
    
    % 将旋转后坐标赋值
    shape_datas(i).X = xy_MS(1,:);
    shape_datas(i).Y = xy_MS(2,:);
end

shapewrite(shape_datas,name);
end