function localBinSauvol(img, figNumber, winSize)
%LOCALBINSAUVOL Summary of this function goes here

R = 128;
k = 0.15;
[X, Y] = size(img);

imgCopy = img;

for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j, winSize, img, X, Y);
        stddev = stddevLT(i,j,winSize, img, mean, X, Y);
        T = mean * (1 - k*(stddev/R - 1));
        if img(i,j) < T
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
title('Obraz zbinearyzowany metodą Sauvol');
end

