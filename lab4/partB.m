clearvars; close all; clc;

phobos = imread('phobos.bmp');
figure(1);
imshow(phobos);
figure(2);
histeq(phobos);

%% 3
load histogramZadany;

figure(3);
plot(histogramZadany);

J = histeq(phobos, histogramZadany);
figure(4);
subplot(1,2,1);
imshow(J);
title('Zadany histogram');
subplot(1,2,2);
imhist(J,255);

%% 4

phobosStretched = imadjust(phobos);
figure(5);
subplot(1,2,1);
imshow(phobosStretched);
title('Rozciąganie');
subplot(1,2,2);
J = adapthisteq(phobos);
imshow(J);
title('Wyrównanie CLAHE');