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
        A = floor([round(j), round(i)]);
        B = A + [1, 0];
        C = A + [1, 1];
        D = A + [0, 1];
        fA = Img2(A);
        fB = Img2(B);
        fC = Img2(C);
        fD = Img2(D);
        current = (A - [i,j]);
        temp = [1-current(1) current(1)]*[fA fD; fB fC];
        nI(ii,jj) = temp .* [1-current(2); current(2)];    
    end
end

figure(2);
img2 = imshow(uint8(nI));