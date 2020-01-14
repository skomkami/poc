close all; clearvars; clc;

img = imread('mglawica_kolor.png');
figure;
imshow(img);
title('Obraz originalny');
maska = load('maska.mat');

YCBCR = rgb2ycbcr(img);

Y = YCBCR(:,:,1);
U = YCBCR(:,:,2);
V = YCBCR(:,:,3);

tilesY = split(Y,8);

tilesY = int8(tilesY - 128);
