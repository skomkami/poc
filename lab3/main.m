clearvars; close all; clc;

load funkcjeLUT;
figure(1);
LUT(imread('lena.bmp'),kwadratowa);

figure(2);
LUT(imread('lena.bmp'),log);

figure(3);
LUT(imread('lena.bmp'),odwlog);

figure(4);
LUT(imread('lena.bmp'),odwrotna);

figure(5);
LUT(imread('lena.bmp'),pierwiastkowa);

figure(6);
LUT(imread('lena.bmp'),pila);

figure(7);
LUT(imread('lena.bmp'),wykladnicza);