close all; clearvars; clc;

img = imread('kw.bmp');

load maskiPP;

%% gradient robertsa

gradients(img, 1, R1, R2, 'Robertsa');

%% gradient Prewitta

gradients(img, 3, P1, P2, 'Prewitta');

%% gradient Sobela

gradients(img, 5, S1, S2, 'Sobela');

%% filtr kombinowany

s1Conv =  uint8(conv2(img, S1, 'same'));
s2Conv =  uint8(conv2(img, S2, 'same'));

ow = sqrt(double(s1Conv.^2 + s2Conv.^2));

ow2 = abs(s1Conv) + abs(s2Conv);

figure(7);
subplot(1,3,1);
imshow(img);
title('Obraz originalny');
subplot(1,3,2);
imshow(uint8(ow), []);
title('Obraz skonwolutowany z filtrem kombinowanym (pierwiastek sumy kwadratów)');
subplot(1,3,3);
imshow(uint8(ow2), []);
title('Obraz skonwolutowany z filtrem kombinowanym (suma modułów)');
