function minD = dis2poly(p,poly)
% 计算点p到多边形poly的最短距离
% poly的每一行都是一条边
    if inpolygon(p(1),p(2),poly(:,1),poly(:,2))
        k = -1; % 内部为负
    else
        k = 1;  % 外部为正
    end
    minD = Inf;
    for i = 1:size(poly,1)-1  % 边序号
        D = dis2edge(p,poly(i,:)',poly(i+1,:)');
        if D < minD
            minD = D;
        end
    end
    minD = k*minD;
    function d = dis2edge(P,A,B)
       % P为计算点,A、B为边的两个顶点 
       % 三者均为列向量
       AB = B-A;
       AP = P-A;
       BP = P-B;
       t = (AB'*AP)/(AB'*AB);
       if t<0
           d = norm(AP); 
       elseif 0<=t && t<=1
           d = norm(P-t*AB);
       else
           d = norm(BP);
       end
    end
end
