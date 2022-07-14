function [] = roateLayer(name,point,theta)

shape_datas = shaperead(name);

shape_counts = length(shape_datas);
% 角度
a = theta / 180 * pi;
% 根据角度构建旋转矩阵
R = [cos(a), -sin(a), 1; sin(a), cos(a), 1; 0,0,1];
% 构建平移矩阵
M = [1, 0, -point(1); 0, 1, -point(2); 0,0,1];

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
    xy_R = R * xy_M;
    % 反平移至原始位置
    xy_MR = M \ xy_R;
    
    % 将旋转后坐标赋值
    shape_datas(i).X = xy_MR(1,:);
    shape_datas(i).Y = xy_MR(2,:);
end
shapewrite(shape_datas,name);


end