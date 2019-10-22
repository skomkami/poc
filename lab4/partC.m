clearvars; close all; clc;
%% 1
lena = imread('lenaRGB.bmp');

figure(1);
imshow(lena);

lenaR = lena(:,:,1);
lenaG = lena(:,:,2);
lenaB = lena(:,:,3);

figure(2);
subplot(3,2,1);
imshow(lenaR);
title('Lena red');
subplot(3,2,2);
imhist(lenaR);

subplot(3,2,3);
imshow(lenaG);
title('Lena green');
subplot(3,2,4);
imhist(lenaG);

subplot(3,2,5);
imshow(lenaB);
title('Lena blue');
subplot(3,2,6);
imhist(lenaB);

%% 2

lenaReven = histeq(lenaR);
lenaGeven = histeq(lenaG);
lenaBeven = histeq(lenaB);

lenaEQ = lena;
lenaEQ(:,:,1) = lenaReven;
lenaEQ(:,:,2) = lenaGeven;
lenaEQ(:,:,3) = lenaBeven;

figure(3);
imshow(lenaEQ);
title('Wyrównany histogram');

%% 3

lenaHSV = rgb2hsv(lena);
lenaH = lenaHSV(:,:,1);
lenaS = lenaHSV(:,:,2);
lenaV = lenaHSV(:,:,3);

figure(4);
subplot(1,3,1);
imhist(lenaH);
title('Lena Hue');
subplot(1,3,2);
imhist(lenaS);
title('Lena Saturation');
subplot(1,3,3);
imhist(lenaV);
title('Lena Value');

lenaVeven = histeq(lenaV, 255);
lenaHSV(:,:,3) = lenaVeven;
figure(5);
imshow(hsv2rgb(lenaHSV));