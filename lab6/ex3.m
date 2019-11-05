close all; clearvars; clc;

moon = imread('moon.bmp');
M = [0 1 0; 1 -4 1; 0 1 0];

M = M / 9;

moonConv =  uint8(conv2(moon, M, 'same'));

moonConvScale = moonConv + 128;
moonConvAbs = abs(moonConv);

%% Laplasjan

lapFilter = fspecial('laplacian');
moonConvLap = uint8(conv2(moon, lapFilter, 'same'));

diff = imsubtract(moon, moonConvLap);

figure(1);
subplot(2,2,1);
imshow(moon);
title('Obraz originalny');
subplot(2,2,2);
imshow(moonConvScale, []);
title('Obraz skonwolutowany (normalizacja przez skalowanie)');
subplot(2,2,3);
imshow(moonConvAbs, []);
title('Obraz skonwolutowany (normalizacja przez moduł)');
subplot(2,2,4);
imshow(diff, []);
title('Różnica originału i obrazu skonwolutowanego)');