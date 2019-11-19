close all; clearvars; clc;

img = imread('ferrari.bmp');

se = strel('square',3);

imgErode = imerode(img, se);
imgDilate = imdilate(img, se);
imgSub = imsubtract(imgDilate, imgErode);

figure(1);

subplot(2,2,1);
imshow(img);
title('Obraz originalny');
subplot(2,2,2);
imshow(imgErode);
title('Erozja z elementem strukturalnym square 3');
subplot(2,2,3);
imshow(imgDilate);
title('Dylatacja z elementem strukturalnym square 3');
subplot(2,2,4);
imshow(imgSub);
title('Gradient morfologiczny');

%% tłumienie jasnych detali

figure(2);
subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(imopen(img, se));
title('Obraz po otwarciu');

%% tłumienie ciemnych detali

figure(3);
subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(imclose(img, se));
title('Obraz po zamknięciu');

%% top-hat bottom-hat

figure(4);
subplot(1,3,1);
imshow(img);
title('Obraz originalny');
subplot(1,3,2);
imshow(imtophat(img, se));
title('Obraz po operacji top-hat');
subplot(1,3,3);
imshow(imbothat(img, se));
title('Obraz  po operacji bottom-hat');

%% rice tophat

img = imread('rice.png');
se = strel('disk',10);

figure(5);
subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(imtophat(img, se));
title('Obraz po operacji top-hat');