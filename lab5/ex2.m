clearvars; close all; clc;

winSize = 15;

rice = imread('rice.png');
localBinearization(rice, 1, 9);

katalog = imread('katalog.bmp');
localBinearization(katalog, 2, 8);

localBinSauvol(rice, 3, 8);
localBinSauvol(katalog, 4, 8);