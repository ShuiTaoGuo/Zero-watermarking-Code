%img 灰度图像 a,b为参数 n为变换次数
function arnoldImg = arnold(img,a,b,n)

[h, w]=size(img);
N =h;
img_new = zeros(h,w);    %[h, w]=size(img) 
for i=1:n   %n为置乱轮数
    for y=1:h
        for x=1:w           
            xx=mod((x-1)+b*(y-1),N)+1;  %a,b可提前指定
            yy=mod(a*(x-1)+(a*b+1)*(y-1),N)+1;        
            img_new(yy,xx)=img(y,x);                
        end
    end
    img=img_new;
end
arnoldImg = img;

end

% 还原代码
% img=img_new;
% for i=1:n
%     for y=1:h
%         for x=1:w            
%             xx=mod((a*b+1)*(x-1)-b*(y-1),N)+1;
%             yy=mod(-a*(x-1)+(y-1),N)+1  ;        
%             img_new(yy,xx)=img(y,x);                   
%         end
%     end
%     img=imgn;
% end

