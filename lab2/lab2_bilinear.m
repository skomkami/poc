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

Img2 = double(Img);

for ii  = 1 : nYY
    i = ii*xStep;
     for jj = 1 : nXX
         j = jj*yStep;
         A = floor([i, j]);
         B = A + [1, 0];
         C = A + [1, 1];
         D = A + [0, 1];
         if floor(C(1) + C(2)*XX)+1 > 10000 || floor(D(1) + D(2)*XX)+1 > 10000
            break
         end
         fA = Img2(floor(A(1)+A(2)*XX)+1);
         fB = Img2(floor(B(1)+B(2)*XX)+1);
         fC = Img2(floor(C(1)+C(2)*XX)+1);
         fD = Img2(floor(D(1)+D(2)*XX)+1);
         current = [i,j]-A;
         nI(ii,jj) = [(1-current(1)) current(1)]*[fA fD; fB fC]*[(1-current(2)); current(2)];
     end
 end
 
 figure(2);
 img2 = imshow(uint8(nI));