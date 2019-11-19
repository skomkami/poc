close all; clearvars; clc;

img = imread('calculator.bmp');

figure(1);
imshow(img);
title('Obraz originalny');

se = ones(1,71);
imgErode = imerode(img, se);

figure(2);
subplot(1,2,1);
reconstructed = imreconstruct(imgErode, img);
imshow(reconstructed);
title('Obraz po otwarciu przez rekonstrukcje');
subplot(1,2,2);
imshow(imopen(img,se));
title('Obraz po klasycznym otwarciu');

%% top-hat poprzez rekonstrukcje

figure(3);

subplot(1,2,1);
imgHor = imsubtract(img, reconstructed);
imshow(imgHor);
title('Obraz zrekonstruowany odjęty od originalnego');
subplot(1,2,2);
imshow(imtophat(img, se));
title('Obraz po operacji top-hat')

%% likwidacja odblasków pionowych

figure(4);

se = ones(1,11);
imgErode = imerode(imgHor, se);
imgReconstructed = imreconstruct(imgErode, imgHor);
imshow(imgReconstructed)
title('Obraz po likwidacji odblasków pionowych');

%% ostatnie detale

figure(5);

se = ones(1,21);
imDilated = imdilate(imgReconstructed, se);
imReconstructed = imreconstruct(min(imDilated, imgHor), imgHor);
imshow(imReconstructed);
