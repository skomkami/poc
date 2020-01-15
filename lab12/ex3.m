close all; clearvars; clc;

img = imread('lunar.bmp');

th = 10;
Y = fft2(img);
Y = fftshift(Y);
fft2abs = log10(abs(Y)+1);
F = angle(Y.*(fft2abs>0.0001));

figure;
subplot(1,3,1);
imshow(img);
title('Obraz originalny');
subplot(1,3,2);
imshow(fft2abs,[]);
title('Amplituda');
subplot(1,3,3);
imshow(F);
title('Faza');

%% odwracanie

Y(fft2abs > th) = 0;
reverse = ifftshift(Y);
reverse = ifft2(reverse);

figure;
subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(reverse,[]);
title('Obraz po usunięciu zakłóceń okresowych');
