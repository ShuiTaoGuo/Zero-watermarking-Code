function [] = Interpolation(name,ratio)
% 
% 函数作用：对数据按比例进行插值
% 
% 输入参数
% name：数据路径
% ratio：插值比例
% 
% 输出参数
% 无
% 

shape_datas = shaperead(name);
shape_counts = length(shape_datas);
% 插值阈值
thereHold = 0.002;

% 插值
for i = 1 : 1 :shape_counts
    x = shape_datas(i).X;
    y = shape_datas(i).Y;
    len_pre = length(x);
    xout = [];
    yout = [];
    % 迭代阈值
    thereCount = 1;
    while(thereCount <= 150)
        thereCount = thereCount + 1;
        [xout,yout] = interpm(x,y,thereHold);
        len_inter = length(xout);
        offeset = len_inter / len_pre - ratio;
        if abs(offeset) <= 0.05
            break;
        else if offeset > 0
                % 实际插值过多，插值阈值调大
                thereHold = (1 + offeset) * thereHold;
            else
                % 实际插值过少，插值阈值调小
                thereHold = (1 + offeset) * thereHold;
            end
        end
    end
    
    % 将插值坐标赋值
    shape_datas(i).X = xout;
    shape_datas(i).Y = yout;

end
shapewrite(shape_datas,name);
end


