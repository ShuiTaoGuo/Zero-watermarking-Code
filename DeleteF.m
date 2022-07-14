function [] = DeleteF(name,ratio_delete)
% 
% 函数作用：对象删除
% 
% 输入参数
% name：文件路径
% ratio：删除比例
% 
% 输出参数
% 无
% 
shape_datas = shaperead(name);
shape_counts = length(shape_datas);
% 删除数量

delete_counts = round( shape_counts * ratio_delete);
% s = rng(23123);
rand_index = randperm(shape_counts,delete_counts);
b=[26,28,29,30,31,33,34,35,36,338,40,41,42,47,50,64,65,66,68,69,70,71,74,77,78,81,113,121,122,123,124,125,126];
b = b+1;
rand_index = setdiff(rand_index,b);

% 删除
shape_datas(rand_index) = [];
% 写入数据
shapewrite(shape_datas,name);
end