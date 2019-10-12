clearvars; close all; clc;

figure(1);
Img = imread("parrot.bmp");
img1 = imshow(Img);

xReScale = 2;
yReScale = 2;
[YY, XX] = size(Img);

nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY, nXX));

xStep = XX/nXX;
yStep = YY/nYY;

Img2 = double(Img);

for jj = 0 : nYY-1
    j = jj*yStep;
     for ii = 0 : nXX-1
         i = ii*xStep;
         A = floor([j,i]);
         B = A + [0, 1];
         C = A + [1, 1];
         D = A + [1, 0];
         if i >= XX-1 || j >= YY-1
            nI(jj+1,ii+1) = Img2(A(1)+1,A(2)+1);
            continue
         end
         fA = Img2(A(1)+1,A(2)+1);
         fB = Img2(B(1)+1,B(2)+1);
         fC = Img2(C(1)+1,C(2)+1);
         fD = Img2(D(1)+1,D(2)+1);
         current = [j,i]-A;
         y = current(1);
         x = current(2);
         
         nI(jj+1,ii+1) = [(1-x) x]*[fA fD; fB fC]*[(1-y); y];
     end
 end
 
 figure(2);
 img2 = imshow(uint8(nI));