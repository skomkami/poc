close all; clearvars; clc;

%% ścienianie

img = imread('fingerprint.bmp');

figure(1);
subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
n = Inf;
imshow(bwmorph(img, 'thin', n));
title(['Obraz ścieniony ' num2str(n) ' razy']);

%% szkeiletyzacja

img = imread('kosc.bmp');

figure(2);
subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(bwmorph(img, 'skel', Inf));
title('Obraz po szkieleryzacji');

%% Otwarcie poprzez rekonstrukcje

img = imread('text.bmp');

se = ones(51,1);

figure(3);
subplot(1,3,1);
imshow(img);
title('Obraz originalny');
subplot(1,3,2);
open = imopen(img, se);
imshow(open);
title('Obraz po otwarciu');
subplot(1,3,3);
imshow(imreconstruct(imerode(open, se), img));
title('Obraz po rekonstrukcji');

%% Wypełnianie dziur
 
figure(4);
subplot(1,2,1);
imshow(img);
title('Obraz originalny');

subplot(1,2,2);
imshow(imfill(img, 'holes'));
title('Obraz po wypełnianiu dziur');

%% Czyszczenie brzegu

figure(5);
subplot(1,2,1);
imshow(img);
title('Obraz originalny');

subplot(1,2,2);
imshow(imclearborder(img));
title('Obraz po czyszczeniu brzegów');

