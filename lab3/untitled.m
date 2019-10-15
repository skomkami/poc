clearvars; close all; clc;

load funkcjeLUT;

figure(1);
plot(kwadratowa);

Img = imread('lena.bmp');
figure(2);
imshow(Img);

ImgIntlut = intlut(Img, kwadratowa);
figure(3);
imshow(ImgIntlut);