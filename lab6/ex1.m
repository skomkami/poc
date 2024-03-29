close all; clearvars; clc;

board = imread('plansza.bmp');

filter3 = fspecial('average', 3);

convulsed = uint8(conv2(board, filter3, 'same'));

figure(1);
subplot(1,3,1);
imshow(board);
title('Obraz originalny');
subplot(1,3,2);
imshow(convulsed);
title('Obraz skonwolutowany');
subplot(1,3,3);
absdiff = imabsdiff(board,convulsed);
subplot(1,3,3);
imshow(absdiff,[]);
title('Moduł różnicy');

%% różne filtracje

filter5 = fspecial('average', 5);
filter9 = fspecial('average', 9);
filter15 = fspecial('average', 15);
filter35 = fspecial('average', 35);

convulsed5 = uint8(conv2(board, filter5, 'same'));
convulsed9 = uint8(conv2(board, filter9, 'same'));
convulsed15 = uint8(conv2(board, filter15, 'same'));
convulsed35 = uint8(conv2(board, filter35, 'same'));

figure(2);
subplot(3,2,1);
imshow(convulsed);
title('Obraz skonwolutowany o rozmiarze okna 3');
subplot(3,2,2);
imshow(convulsed5);
title('Obraz skonwolutowany o rozmiarze okna 5');
subplot(3,2,3);
imshow(convulsed9);
title('Obraz skonwolutowany o rozmiarze okna 9');
subplot(3,2,4);
imshow(convulsed15);
title('Obraz skonwolutowany o rozmiarze okna 15');
subplot(3,2,5);
imshow(convulsed35);
title('Obraz skonwolutowany o rozmiarze okna 35');
subplot(3,2,6);
imshow(board);
title('Obraz originalny');


%% lena

lena = imread('lena.bmp');
convulsedLena3 = uint8(conv2(lena, filter3, 'same'));
convulsedLena5 = uint8(conv2(lena, filter5, 'same'));
convulsedLena9 = uint8(conv2(lena, filter9, 'same'));
convulsedLena15 = uint8(conv2(lena, filter15, 'same'));
convulsedLena35 = uint8(conv2(lena, filter35, 'same'));

figure(3);
imshow(lena);
title('Obraz originalny');

figure(4);
subplot(3,2,1);
imshow(convulsedLena3);
title('Obraz skonwolutowany o rozmiarze okna 3');
subplot(3,2,2);
imshow(convulsedLena5);
title('Obraz skonwolutowany o rozmiarze okna 5');
subplot(3,2,3);
imshow(convulsedLena9);
title('Obraz skonwolutowany o rozmiarze okna 9');
subplot(3,2,4);
imshow(convulsedLena15);
title('Obraz skonwolutowany o rozmiarze okna 15');
subplot(3,2,5);
imshow(convulsedLena35);
title('Obraz skonwolutowany o rozmiarze okna 35');
subplot(3,2,6);
imshow(lena);
title('Obraz originalny');

%% dobór maski

M = [1 2 1; 2 4 2; 1 2 1];

M = M / sum(sum(M));

figure(5);

lenaConvulsedM = uint8(conv2(lena, M, 'same'));

subplot(1,2,1);
imshow(lena);
title('Obraz originalny');
subplot(1,2,2);
imshow(lenaConvulsedM);

%% maska gaussa

gaussianMask = fspecial('gaussian', 5, 0.5);
gaussianMask2 = fspecial('gaussian', 5, 0.8);
gaussianMask3 = fspecial('gaussian', 5, 0.3);

% wpływ odchylenia na filtr
figure(6);
subplot(1,3,1);
mesh(gaussianMask);
title(['Filtr dla odchylenia = ' num2str(0.5)]);
subplot(1,3,2);
mesh(gaussianMask2);
title(['Filtr dla odchylenia = ' num2str(0.8)]);
subplot(1,3,3);
mesh(gaussianMask3);
title(['Filtr dla odchylenia = ' num2str(0.3)]);

%% filtracje gausowe leny

convulsedLenaGauss = uint8(conv2(lena, gaussianMask, 'same'));
convulsedLenaGauss2 = uint8(conv2(lena, gaussianMask2, 'same'));
convulsedLenaGauss3 = uint8(conv2(lena, gaussianMask3, 'same'));

figure(7);
subplot(2,2,1);
imshow(lena);
title('Obraz originalny');
subplot(2,2,2);
imshow(convulsedLenaGauss);
title('Obraz skonwolutowany z filtrem dla odchylenia 0.5');
subplot(2,2,3);
imshow(convulsedLenaGauss2);
title('Obraz skonwolutowany z filtrem dla odchylenia 0.8');
subplot(2,2,4);
imshow(convulsedLenaGauss3);
title('Obraz skonwolutowany z filtrem dla odchylenia 0.3');

