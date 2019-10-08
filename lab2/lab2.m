clearvars; close all; clc;

figure(1);
Img = imread("parrot.bmp");
img1 = imshow(Img);

xReScale = 1.5;
yReScale = 1.5;
[YY, XX] = size(Img);

nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY, nXX));

xStep = XX/nXX;
yStep = YY/nYY;

for ii  = 0 : nYY-1
    i = round(ii*xStep);
    for jj = 0 : nXX - 1
        j = round(jj*yStep);
        nI(jj+1, ii+1) = Img(j+1, i+1);
    end
end

figure(2);
img2 = imshow(nI);