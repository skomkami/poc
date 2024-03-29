function localBinearization(img, figNumber, winSize)
%LOCALBINEARIZATION Summary of this function goes here
%   Detailed explanation goes here
[X, Y] = size(img);

imgCopy = img;

for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j, winSize, img, X, Y);
        if img(i,j) < mean
            imgCopy(i,j) = 0;
        else
            imgCopy(i,j) = 255;
        end
    end
end

figure(figNumber);
subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(imgCopy);
title('Obraz zbinearyzowany');
end

