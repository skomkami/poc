clearvars; close all; clc;

Img = imread('100zloty.jpg');
figure(1);
[X Y Z] = size(Img);
subplot(3,3,1);
imshow(Img);

bitplanesliced = uint8(zeros(8, X, Y, Z));

for i = 0:7
    bitplanesliced( i+1,:, :, :) = bitand(uint8(ones(X,Y,Z))*2^i, Img)/2^i;
end

for i = 1:8
    subplot(3,3,i+1);
    img = squeeze(bitplanesliced(i,:,:,:));
    imshow(img*255);
end

figure(2);
subplot(2,2,1);
imshow(Img);

ImgBit8 = squeeze(bitplanesliced(8,:,:,:));
ImgBit7 = squeeze(bitplanesliced(7,:,:,:));
ImgBit6 = squeeze(bitplanesliced(6,:,:,:));

subplot(2,2,2);
imshow(ImgBit8*2^7 + ImgBit7*2^6 + ImgBit6*2^5);

ImgBit4 = squeeze(bitplanesliced(4,:,:,:));
ImgBit2 = squeeze(bitplanesliced(2,:,:,:));
ImgBit1 = squeeze(bitplanesliced(1,:,:,:));

subplot(2,2,3);
imshow(ImgBit8*2^7 + ImgBit4*2^3 + ImgBit2*2);

subplot(2,2,4);
imshow(ImgBit6*2^5 + ImgBit2*2^1 + ImgBit1);
