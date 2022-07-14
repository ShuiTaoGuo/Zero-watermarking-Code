function [ratio_index,ratio_off] = get_point_ratio( path_point, path_linAgon )
% 第一个参数是一个点数据路径数组
% 第二个参数是一个线、面数据路径数组

    % 首先读取所有点数据
    feature_center_points_array = [];
    shapedata_points_array = [];

    for i=1:1:length(path_point)
       % 读取数据，返回结果：第一个是中心点，第二个是面积，第三个是要素集合
       [feature_center_points,feature_area_points,shapedata_points] = shape_read(path_point(i),0);
       feature_center_points_array = [feature_center_points_array;feature_center_points];
       shapedata_points_array = [shapedata_points_array;shapedata_points];
    end

    % 读取所有线面数据
    feature_center_linegons_array = [];
    feature_area_linegons_array = [];
    shapedata_linegons = [];

    for i = 1:1:length(path_linAgon)
        [feature_center_lines,feature_area_lines,shapedata_lines] = shape_read(path_linAgon(i),1);
        feature_center_linegons_array = [feature_center_linegons_array;feature_center_lines];
        feature_area_linegons_array = [feature_area_linegons_array;feature_area_lines];
        shapedata_linegons = [shapedata_linegons;shapedata_lines];    
    end

    % 计算检索每个点的K个最近邻点
    K  =  50;

    % 对于点数据，找到距离自己最近的K个点，然后找到第一个包含自己的面，第一个与自己相离的面
    % 设置判断标准 
    kdtreeobj = KDTreeSearcher(feature_center_linegons_array,'distance','euclidean');
    % 最近邻检索，第一个参数是被检索数据，第二个参数是检索数据
    center_line_gon = feature_center_linegons_array;

     [index_point2gon,dist_point2gon]=knnsearch(center_line_gon,feature_center_points,'dist','euclidean','k',K);

     % 记录相交比率
     ratio_inter_point=[];
     % 记录相离比率
     ratio_off_point = [];
     
     

end