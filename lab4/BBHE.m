clearvars; close all; clc;

%% 1

jet = imread('jet.bmp');
[H, x] = imhist(jet);

mean = round(mean(jet(:)));

