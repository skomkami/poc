clearvars; close all; clc;

lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

figure(1);
subplot(4,2,1);
imshow(lena1);
subplot(4,2,2);
imhist(lena1,256);

subplot(4,2,3);
imshow(lena2);
subplot(4,2,4);
imhist(lena2,256);

subplot(4,2,5);
imshow(lena3);
subplot(4,2,6);
imhist(lena3,256);

subplot(4,2,7);
imshow(lena4);
subplot(4,2,8);
imhist(lena4,256);

%% rozciągnięcie histogramu -> imadjust
figure(2);
hist1 = imread('hist1.bmp');
subplot(1,2,1);
imshow(hist1);
subplot(1,2,2);
imhist(hist1, 256);

figure(3);
adjhist = imadjust(hist1);
subplot(1,2,1);
imshow(adjhist);
subplot(1,2,2);
imhist(adjhist, 256);

%% histogram skumulowany

[H,x] = imhist(hist1,256);
C = cumsum(H);

figure(4);
k = max(C)/max(H);
C2 = C/k;
plot(x,H);
hold on;
plot(x,C2);
hold off;
legend('histogram','histogram skumulowany');

%% lut
lut = C2*255/max(C2);
lut = uint8(lut);
histlut = intlut(hist1, lut);
[Hlut, xlut] = imhist(histlut, 256);
Clut = cumsum(Hlut);
klut = max(Clut)/max(Hlut);
C2lut = Clut/klut;

figure(5);
subplot(3,1,1);
imshow(histlut);
subplot(3,1,2);
plot(xlut,Hlut);
title('Histogram');
subplot(3,1,3);
plot(xlut,C2lut);
title('Histogram skumulowany');

%% 13

X = histeq(hist1, 256);

figure(6);
subplot(3,1,1);
imshow(X);
subplot(3,1,2);
imhist(X,256);
title('Histogram wyrównany');
subplot(3,1,3);
J = adapthisteq(hist1);
imhist(J);
title('Histogram wyrównany CLAHE');

%14

hist2 = imread('hist2.bmp');
hist2adj = imadjust(hist2);
hist3 = imread('hist3.bmp');
hist3adj = imadjust(hist3);
hist4 = imread('hist4.bmp');
hist4adj = imadjust(hist4);

figure(7);
subplot(2,2,1);
imshow(hist2);
title('Originał');
subplot(2,2,2);
imshow(hist2adj);
title('Rozciąganie');
subplot(2,2,3);
histeq(hist2, 256);
title('Wyrównanie HE');
subplot(2,2,4);
J = adapthisteq(hist2);
imshow(J);
title('Wyrównanie CLAHE');

figure(8);
subplot(2,2,1);
imshow(hist3);
title('Originał');
subplot(2,2,2);
imshow(hist3adj);
title('Rozciąganie');
subplot(2,2,3);
histeq(hist3, 256);
title('Wyrównanie HE');
subplot(2,2,4);
J = adapthisteq(hist3);
imshow(J);
title('Wyrównanie CLAHE');

figure(9);
subplot(2,2,1);
imshow(hist4);
title('Originał');
subplot(2,2,2);
imshow(hist4adj);
title('Rozciąganie');
subplot(2,2,3);
histeq(hist4, 256);
title('Wyrównanie HE');
subplot(2,2,4);
J = adapthisteq(hist4);
imshow(J);
title('Wyrównanie CLAHE');