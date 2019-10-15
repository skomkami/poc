clearvars; close all; clc;

load funkcjeLUT;
figure(1);

lena = imread('lena.bmp');
LUT(lena, kwadratowa);

figure(2);
LUT(lena, log);

figure(3);
LUT(lena, odwlog);

figure(4);
LUT(lena, odwrotna);

figure(5);
LUT(lena ,pierwiastkowa);

figure(6);
LUT(lena, pila);

figure(7);
LUT(lena ,wykladnicza);