clearvars; close all; clc;

lena = imread('lena.bmp');
jet = imread('jet.bmp');

lenaPlusJet = imadd(lena, jet);
figure(1);
imshow(lenaPlusJet);

lenaPlusJet16b = imadd(lena, jet, 'uint16');
figure(2);
imshow(lenaPlusJet16b, []);

lenaComJet = imlincomb(0.5, lena, 0.75, jet);
figure(3);
imshow(lenaComJet, []);

lenaSubJet = imsubtract(lena, jet);
figure(4);
imshow(lenaSubJet);

lena16 = int16(lena);
jet16 = int16(jet);
lenaSubJetS = imsubtract(lena16, jet16);
figure(5);
imshow(lenaSubJetS, []);

lenaAbsSubJet = imabsdiff(lena, jet);
figure(6);
imshow(lenaAbsSubJet);

lenaMulJet = immultiply(lena,jet);
figure(7);
imshow(lenaMulJet);

lenaMulByConst = 1.5 * lena;
figure(8);
imshow(lenaMulByConst);

maska = imread('kolo.bmp');
maska = boolean(maska);

jetMulMask = immultiply(jet, maska);
figure(9);
imshow(jetMulMask);

lenaNegative = imcomplement(lena);
figure(10);
imshow(lenaNegative);
