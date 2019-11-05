close all; clearvars; clc;

moon = imread('moon.bmp');
M = [0 1 0; 1 -4 1; 0 1 0];

M = M / 9;

moonConv =  uint8(conv2(moon, M, 'same'));

moonConvScale = moonConv + 128;
moonConvAbs = abs(moonConv);

figure(1);
subplot(1,3,1);
imshow(moon);
title('Obraz originalny');
subplot(1,3,2);
imshow(moonConvScale, []);
title('Obraz skonwolutowany (normalizacja przez skalowanie)');
subplot(1,3,3);
imshow(moonConvAbs, []);
title('Obraz skonwolutowany (normalizacja przez moduł)');

%% Laplasjan

lapFilter = fspecial('laplacian', 1);