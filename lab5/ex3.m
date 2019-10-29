clearvars; close all; clc;

bart = imread('bart.bmp');

figure(1);
subplot(1,2,1);
imshow(bart);
subplot(1,2,2);
imhist(bart, 256);

upperThres = 205;
lowerThres = 189;

bartBW = bart > lowerThres & bart < upperThres;
bartBW = uint8(bartBW*255);

figure(2);
imshow(bartBW);