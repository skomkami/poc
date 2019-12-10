close all; clearvars; clc;

img = imread('ccl2.png');
subplot(1,3,1);
imshow(img,[]);
title('Obraz originalny');
subplot(1,3,2);
imshow(bwlabel(img,4));
title('Indeksacja z sąsiedztwem 4-elementowym')
subplot(1,3,3);
imshow(bwlabel(img,8));
title('Indeksacja z sąsiedztwem 8-elementowym')