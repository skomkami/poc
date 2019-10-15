clearvars; close all; clc;

kolo = imread('kolo.bmp');
kwadrat = imread('kwadrat.bmp');

figure(1);
imshow(kolo);
figure(2);
imshow(kwadrat);

kolo = boolean(kolo);
kwadrat = boolean(kwadrat);

figure(4);
imshow(~kwadrat);

figure(5);
imshow(kolo&kwadrat);

figure(6);
imshow(kolo|kwadrat);

figure(7);
imshow(xor(kolo, kwadrat));