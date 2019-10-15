clearvars; close all; clc;

figure(1);
Img = imread("parrot.bmp");
img1 = imshow(Img);

xReScale = 1.5;
yReScale = 2;
[YY, XX] = size(Img);

nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

xStep = XX/nXX;
yStep = YY/nYY;
Img2 = double(Img);

load('a1.mat');

for jj = 0 : nYY-1
    j = jj*yStep;
     for ii = 0 : nXX-1
         i = ii*xStep;
         A = floor([j,i]);
         B = A + [0, 1];
         C = A + [1, 1];
         D = A + [1, 0];
         
         fA = GetPixel(Img2, A(1), A(2));
         fB = GetPixel(Img2, B(1), B(2));
         fC = GetPixel(Img2, C(1), C(2));
         fD = GetPixel(Img2, D(1), D(2));
         
         Ax = (GetPixel(Img2, A(1),A(2)+1)-GetPixel(Img2, A(1),A(2)-1))/2;
         Ay = (GetPixel(Img2, A(1)+1,A(2))-GetPixel(Img2, A(1)-1,A(2)))/2;
         Axy = (GetPixel(Img2, A(1)+1,A(2)+1)-GetPixel(Img2, A(1),A(2)-1)-GetPixel(Img2, A(1)-1,A(2))+GetPixel(Img2, A(1),A(2)))/4;
         Bx = (GetPixel(Img2, B(1),B(2)+1)-GetPixel(Img2, B(1),B(2)-1))/2;
         By = (GetPixel(Img2, B(1)+1,B(2))-GetPixel(Img2, B(1)-1,B(2)))/2;
         Bxy = (GetPixel(Img2, B(1)+1,B(2)+1)-GetPixel(Img2, B(1),B(2)-1)-GetPixel(Img2, B(1)-1,B(2))+GetPixel(Img2, B(1),B(2)))/4;
         Cx = (GetPixel(Img2, C(1),C(2)+1)-GetPixel(Img2, C(1),C(2)-1))/2;
         Cy = (GetPixel(Img2, C(1)+1,C(2))-GetPixel(Img2, C(1)-1,C(2)))/2;
         Cxy = (GetPixel(Img2, C(1)+1,C(2)+1)-GetPixel(Img2, C(1),C(2)-1)-GetPixel(Img2, C(1)-1,C(2))+GetPixel(Img2, C(1),C(2)))/4;
         Dx = (GetPixel(Img2, D(1),D(2)+1)-GetPixel(Img2, D(1),D(2)-1))/2;
         Dy = (GetPixel(Img2, D(1)+1,D(2))-GetPixel(Img2, D(1)-1,D(2)))/2;
         Dxy = (GetPixel(Img2, D(1)+1,D(2)+1)-GetPixel(Img2, D(1),D(2)-1)-GetPixel(Img2, D(1)-1,D(2))+GetPixel(Img2, D(1),D(2)))/4;

         xs = [fA; fB; fD; fC; Ax; Bx; Dx; Cx; Ay; By; Dy; Cy; Axy; Bxy; Dxy; Cxy];
         a = A1*xs;
         current = [j,i]-A;
         y = current(1);
         x = current(2);
         
         sum = 0.0;
         for b = 0:3
             for c = 0:3
                 sum = sum + a(b*4+c+1)*x^c*y^b;
             end
         end        
         nI(jj+1,ii+1) = sum;
     end
 end
 
 figure(2);
 imshow(uint8(nI));
 
 function safePoint = SafePoint(P, YY, XX)
    safePoint(1) = min(P(1), YY);
    safePoint(2) = min(P(2), XX);
    safePoint(1) = max(safePoint(1), 1);
    safePoint(2) = max(safePoint(2), 1);
 end

 function pixel = GetPixel(Img, j, i)
    [YY, XX] = size(Img);
    safePoint = SafePoint([j+1,i+1], YY, XX);
    pixel = Img(safePoint(1), safePoint(2));
 end