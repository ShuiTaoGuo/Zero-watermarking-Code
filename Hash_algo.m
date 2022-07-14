function [hash_index] = Hash_algo(ratio,length_range)

seed_rng = 1;
hash_index = 1;
therehold = pow2(32);
if(~isnan(ratio))
    seed_rng = typecast(ratio,'uint64');
    seed_rng = rem(seed_rng,therehold);
    s = rng(seed_rng);
    % 获取五位随机数
    randD = rand(1,5);
    % 取第一个为随机数
    ratio = randD(1);
    % 设置区间，根据区间进行映射
    % length_range = 4999;
    hash_index = round(ratio * (length_range - 1)) + 1;
    
end
% 
% % value_4 = eval(vpa(ratio,4));
% % % 将上述数转化为字符串，去除可能的小数点
% % str_4 = erase(num2str(value_4),'.');
% % len = 4 - strlength(str_4);
% % if len > 0
% %     str_extend = char(zeros(1,len)+'0');
% %     str_4 =strcat (str_4,str_extend);
% % end
% % len = 1;
% % % 提取三位有效数字
% % str_3 = str_4(len:end - 1);
% % % % 提取三位有效数字,转化为数字索引
% % % index = str2num(str_3);
% % if length(str_3) == 2
% %     L = 1;
% % end
% % % 根据三位有效数字进行Hash值得计算
% % % max = 1000;
% % [hash_index] = hashFunc(str_3, length_range);
% 
% 
%     therehold = pow2(32);
%     % 转化为正整数
%     ratio = abs(ratio);
%     % 判断正整数是否合限
%     ratio_enlarge = [];
%     if(ratio<therehold && ratio * 10000 < therehold)
%         ratio_enlarge = ratio * 10000;   
%     elseif(ratio * 10000 < therehold)
%         ratio_enlarge = ratio;
%     else
%         ratio_enlarge = rem(ratio,therehold);
%     end
% 
% 
%     % 先将比值转化为四位有效数字的数
%     value_4 = eval(vpa(ratio_enlarge,3));
%     hash_index = 1;
%     % value_4
%     % % 提取前三位
%     % value_3 = eval(vpa(value_4,3));
%     % 设置三位有效数字为随机数种子
%     if (~isnan(value_4))
%         s = rng(value_4);
%         % 获取五位随机数
%         randD = rand(1,5);
%         % 取第一个为随机数
%         ratio = randD(1);
%         % 设置区间，根据区间进行映射
%         % length_range = 4999;
%         hash_index = round(ratio * (length_range - 1)) + 1;
% 
%         % % 按照长度取余
%         % hash_index = rem(hash_index,length_range) + 1;
%     end
end


function  [hashValue] = hashFunc(str, max)
    % 1.初始化hashValue的值
    hashValue = 0;
    % 2.霍纳算法, 来计算hashValue的数值
    for i = 1:1:length(str)-1
        hashValue = 37 * hashValue + str(i);
    end
    
    if (str(3) >= '0') && (str(3) <= '3')
         hashValue = 37 * hashValue + '2';
    else if (str(3) > '3') && (str(3) <= '6')
             hashValue = 37 * hashValue + '5';
        
    else
        hashValue = 37 * hashValue + '8';
        end
    end
    % 3.取模运算
    hashValue = rem( hashValue, max) + 1;
end