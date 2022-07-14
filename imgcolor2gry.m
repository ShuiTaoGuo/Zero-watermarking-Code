function [] = imgcolor2gry(path_read,path_write)

    %读数据
    subplot(1, 2, 1);
    a = imread(path_read);
    imshow(a);
    title('原图');

    %彩色图像二值化
    subplot(1, 2, 2);
    thresh = graythresh(a);%自动确定阈值
    b = im2bw(a, thresh);
    imshow(b);
    title('二值化');

    %生成二值图像
    imwrite(b, path_write);			% 这里可以写成imwrite(b, stract('C:\路径\', 'binary_image2', '.bmp'))

end