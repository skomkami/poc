clearvars; close all; clc;

coins = imread('coins.png');

figure(1);
subplot(1,2,1);
imshow(coins);
subplot(1,2,2);
imhist(coins,256);

threshold = 85;

figure(2);
im2bw(coins, threshold/255);

%% 4 figura

fig = imread('figura.png');

figure(3);
subplot(1,2,1);
imshow(fig);
subplot(1,2,2);
imhist(fig,256);

%% figura2
fig2 = imread('figura2.png');
figure(4);
imhist(fig2, 256);
title('Figura 2 histogram');

%% figura3

fig3 = imread('figura3.png');
figure(5);
imhist(fig3, 256);
title('Figura 3 histogram');

%% figura4

fig4 = imread('figura4.png');
figure(6);
imhist(fig4,256);

%% metoda Otsu

thresh = graythresh(coins);
figure(7);
subplot(1,2,1);
im2bw(coins, threshold/255);
title('Własnoręcznie dobrany próg');
subplot(1,2,2);
im2bw(coins, thresh);
title('Próg dobrany metodą Otsu');

%% Kittler i Yen (coins)

binComparison(coins, 8, threshold);

%% Kittler i Yen (rice)

rice = imread('rice.png');
threshold = 128;
binComparison(rice, 9, threshold);

%% Kittler i Yen (tekst)

tekst = imread('tekst.bmp');
threshold = 180;
binComparison(tekst, 10, threshold);

%% Kittler i Yen (obiekty)

obiekty = imread('obiekty.bmp');
threshold = 172;
binComparison(obiekty, 11, threshold);

%% Kittler i Yen (katalog)

katalog = imread('katalog.bmp');
threshold = 128;
binComparison(katalog, 12, threshold);


