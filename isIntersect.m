function [isinterset] = isIntersect(X1,Y1,X2,Y2)

    % Bounding box test
    minP1x = min(X1);
    maxP1x = max(X1);
    minP1y = min(Y1);
    maxP1y = max(Y1);
    minP2x = min(X2);
    maxP2x = max(X2);
    minP2y = min(Y2);
    maxP2y = max(Y2);


    if ((minP1x < maxP2x) && (maxP1x > minP2x) && (minP1y < maxP2y) && (maxP1y > minP2y))
        % Checking if any of the segments of the 2 polygons are crossing
        % S. H鰈z function    
        [x,y] = curveintersect(X1,Y1,X2,Y2);
        if ~isempty(x)
            isinterset = 1;
        else
            isinterset = 0;
        end
    else
        isinterset = 0;
    end
        
end