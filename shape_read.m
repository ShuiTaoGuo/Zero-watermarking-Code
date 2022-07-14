function [feature_center,feature_area,shape_datas] = shape_read(name,type)
% 读取数据
% 
% 输入参数
% name：数据路径
% 
% 返回值
% feature_center：各个要素最小外接矩形中心
% feature_area：各个要素的面积
% 
    shape_datas = shaperead(name);
    shape_counts = length(shape_datas);

    % 记录各个图形的中心点
    feature_center = [];
    feature_area = [];

    if (type == 0)
        for shape_current = 1:1:shape_counts
            % 获取当前要素
            shape_data = shape_datas(shape_current);
            % 获取单个要素的X坐标集合,去除最后的NaN值
            coords_x = shape_data.X(~isnan(shape_data.X));
            % 获取单个要素的Y坐标集合,去除最后的NaN值
            coords_y = shape_data.Y(~isnan(shape_data.Y));

            % 保存数据中心点和面积，用作后续实验
            feature_center = [feature_center;coords_x,coords_y];
            feature_area = [feature_area;0];
        end            
    else
        % 计算线数据各要素的最小外接矩形中心点
        for shape_current = 1:1:shape_counts
            % 获取当前要素
            shape_data = shape_datas(shape_current);
            % 获取单个要素的X坐标集合,去除最后的NaN值
            coords_x = shape_data.X(~isnan(shape_data.X));
            % 获取单个要素的Y坐标集合,去除最后的NaN值
            coords_y = shape_data.Y(~isnan(shape_data.Y));
%             shape_current
            % 计算要素面积
            shape_area = polyarea(coords_x,coords_y);

            % 获取构建最小外接矩形的索引
            [rectx,recty,~,~,index,~,~] = minboundrect(coords_x,coords_y,'a');
            % 获取外接矩形中心点
            count_rect = length(rectx) - 1;
            rectx = rectx(1:count_rect);
            recty = recty(1:count_rect);
            dx = mean(rectx);
            dy = mean(recty);

            % 保存数据中心点和面积，用作后续实验
            feature_center = [feature_center;dx,dy];
            feature_area = [feature_area;shape_area];    
        end
    end    
end