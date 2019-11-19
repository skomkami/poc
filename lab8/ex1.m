close all; clearvars; clc;

img = imread('ertka.bmp');

se = strel('square',3);

imgErode = imerode(img, se);

figure(1);

subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(imgErode);
title('Erozja z elementem strukturalnym square 3');


se = strel('sphere',2);

imgErode = imerode(img, se);

figure(2);

subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(imgErode);
title('Erozja z elementem strukturalnym sphere 3');

%% 3 krotna erozja square 3

se = strel('square',3);

imgErode = img;

for i = 1:3
    imgErode = imerode(imgErode, se);
end


figure(3);

subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(imgErode);
title('Erozja 3 krotna z elementem strukturalnym square 3');

%% buzka

img = imread('buzka.bmp');

se = [0 1 0; 0 1 0; 0 0 0];
%se = [0 0 0; 1 1 0; 0 0 0];

figure(4);
subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(imerode(img, se));
title('Obraz z elementem do wycięcia włosów');

%% dylatacja

img = imread('ertka.bmp');
se = strel('square',3);

figure(5);
subplot(3,2,1:2);
imshow(img);
title('Obraz originalny');
subplot(3,2,3);
imshow(imerode(img, se));
title('Obraz po erozji');
subplot(3,2,4);
imshow(imdilate(img, se));
title('Obraz po dylatacji');
subplot(3,2,5);
imshow(imopen(img, se));
title('Obraz po otwarciu');
subplot(3,2,6);
imshow(imclose(img, se));
title('Obraz po zamknięciu');


img = imread('wyspa.bmp');

figure(6);
subplot(3,2,1:2);
imshow(img);
title('Obraz originalny');
subplot(3,2,3);
imshow(imerode(img, se));
title('Obraz po erozji');
subplot(3,2,4);
imshow(imdilate(img, se));
title('Obraz po dylatacji');
subplot(3,2,5);
imshow(imopen(img, se));
title('Obraz po otwarciu');
subplot(3,2,6);
imshow(imclose(img, se));
title('Obraz po zamknięciu');


img = imread('kolka.bmp');

figure(7);
subplot(3,2,1:2);
imshow(img);
title('Obraz originalny');
subplot(3,2,3);
imshow(imerode(img, se));
title('Obraz po erozji');
subplot(3,2,4);
imshow(imdilate(img, se));
title('Obraz po dylatacji');
subplot(3,2,5);
imshow(imopen(img, se));
title('Obraz po otwarciu');
subplot(3,2,6);
imshow(imclose(img, se));
title('Obraz po zamknięciu');

%% napis RT

img = imread('ertka.bmp');

se = [1 0 1; 0 0 0; 1 0 1];

figure(8);
imshow(imdilate(imerode(img, se), strel('square', 4)));

%% hom

img = imread('hom.bmp');
se1 = [0 1 0; 1 1 1; 0 1 0];
se2 = [1 0 1; 0 0 0; 1 0 1];

figure(9);
subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(bwhitmiss(img, se1, se2));
title('Obraz po operacji trafi nie trafi');