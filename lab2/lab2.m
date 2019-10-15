clearvars; close all; clc;

figure(1);
Img = imread("parrot.bmp");
img1 = imshow(Img);

xReScale = 3;
yReScale = 2;
[YY, XX] = size(Img);

nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY, nXX));

xStep = XX/nXX;
yStep = YY/nYY;

for jj  = 0 : nYY-1
    j = round(jj*yStep);
    for ii = 0 : nXX - 1
        i = round(ii*xStep);
        nI(jj+1, ii+1) = Img(min(YY,j+1), min(XX,i+1));
    end
end

figure(2);
img2 = imshow(nI);

