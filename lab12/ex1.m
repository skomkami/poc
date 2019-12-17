close all; clearvars; clc;

img = imread('dwieFale.bmp');

fftOperations(img);

%% kolo

img = imread('kolo.bmp');

fftOperations(img);

%% kwadrat

img = imread('kwadrat.bmp');

fftOperations(img);

%% kwadrat45

img = imread('kwadrat45.bmp');

fftOperations(img);

%% trojkat

img = imread('trojkat.bmp');

fftOperations(img);