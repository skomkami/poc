close all; clearvars; clc;

img = imread('shapes.png');
figure;
imshow(img,[]);

indexed = bwlabel(img);
figure;
imshow(indexed);

figure;
imshow(getShape(indexed, 'circle'));

%% shapesReal

img2 = imread('shapesReal.png');
figure;
imshow(img2);
% figure;
% imhist(img2);


imgBin = im2bw(img2, 100/255);
square = strel('square', 3);
imgDilated = imdilate(imgBin, square);
imgFinal = imclearborder(not(imgDilated));

indexed = bwlabel(imgFinal);

figure;
imshow(indexed);

figure;
subplot(2,2,1);
imshow(getShape(indexed, 'circle'))
subplot(2,2,2);
imshow(getShape(indexed, 'square'))
subplot(2,2,3);
imshow(getShape(indexed, 'triangle'))
subplot(2,2,4);
imshow(getShape(indexed, 'L'))
