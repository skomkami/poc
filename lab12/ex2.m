close all; clearvars; clc;

img = imread('lena.bmp');

fftOperations(img);

%% filtracja górnoprzepustowa

[f1,f2] = freqspace(512, 'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);

Hd(r>0.1) = 0;

figure;
colormap(jet(64)); mesh(f1,f2,Hd);


Y = fft2(img);
Y = fftshift(Y);
A = abs(Y);
A = log10(A+1);

F = angle(Y.*(A>0.0001));

filtered = Y.*Hd;

reverse = ifftshift(filtered);
reverse = ifft2(reverse);


figure;
imshow(reverse,[]);

h = fwind1(Hd,hanning(21));
[H f1 f2] = freqz2(h,512,512);

figure;
mesh(f1,f2,H);

%% filtr gaussa

[y,x] = size(img);

filtr = fspecial('gaussian', y, 25);

filtr = mat2gray(filtr);
figure;
imshow(filtr);

filtered = Y.*filtr;
%figure;
%imshow(filtered);
%title('transformancja z filtrem gaussa');

reverse = ifftshift(filtered);
reverse = ifft2(reverse);
figure;
imshow(uint8(reverse));
title('po transformacie odwrotnej')

