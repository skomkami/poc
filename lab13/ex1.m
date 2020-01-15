close all; clearvars; clc;

img = imread('mglawica_kolor.png');
figure;
imshow(img);
title('Obraz originalny');

%% Kodowanie
% współczynnik kompresji
c = 2;

load('tablice_kwantyzacji.mat');
YCBCR = rgb2ycbcr(img);

% YCBCR = int8(YCBCR - 128);

Y = YCBCR(:,:,1);
U = YCBCR(:,:,2);
V = YCBCR(:,:,3);

cosineTransformFun = @(block_struct) dct2(block_struct.data);

block_size = [8,8];
% dyskretna transformacja kosinusowa
cosineTransformedY = blockproc(Y, block_size, cosineTransformFun);
cosineTransformedU = blockproc(U, block_size, cosineTransformFun);
cosineTransformedV = blockproc(V, block_size, cosineTransformFun);

% kwantyzacja

quantizationY = @(block_struct) round(block_struct.data ./ (c .* Qy));
quantizationC = @(block_struct) round(block_struct.data ./ (c .* Qc));

quantizatedY = blockproc(cosineTransformedY, block_size, quantizationY);
quantizatedU = blockproc(cosineTransformedU, block_size, quantizationC);
quantizatedV = blockproc(cosineTransformedV, block_size, quantizationC);

% [Y, X, Z] = size(img);
% encoded = zeros(Y, X, Z);
% encoded(:,:,1) = quantizatedY;
% encoded(:,:,2) = quantizatedU;
% encoded(:,:,3) = quantizatedV;

%% Dekodowanie

% dekwantyzacja

dequantizationFuncY = @(block_struct) block_struct.data .* (c * Qy);
dequantizationFuncC = @(block_struct) block_struct.data .* (c * Qy);

dequantizatedY = blockproc(quantizatedY, block_size, dequantizationFuncY);
dequantizatedU = blockproc(quantizatedU, block_size, dequantizationFuncC);
dequantizatedV = blockproc(quantizatedV, block_size, dequantizationFuncC); 

% odwrotna transformacja kosinusowa

cosineInverseTransformFun = @(block_struct) idct2(block_struct.data);

revertedY = blockproc(dequantizatedY, block_size, cosineInverseTransformFun);
revertedU = blockproc(dequantizatedU, block_size, cosineInverseTransformFun);
revertedV = blockproc(dequantizatedV, block_size, cosineInverseTransformFun);

[Y, X, Z] = size(img);
decoded = zeros(Y, X, Z);
decoded(:,:,1) = revertedY;
decoded(:,:,2) = revertedU;
decoded(:,:,3) = revertedV;

decoded = ycbcr2rgb(uint8(decoded));

figure;
imshow(decoded);
title('Obraz zdekodowany');




