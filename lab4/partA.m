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

