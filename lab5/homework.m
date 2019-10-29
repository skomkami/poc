clearvars; close all; clc;

text = imread('tekstReczny.png');

threshold = 111;
thresh = graythresh(text);

figure(1);
subplot(2,2,1);
imshow(text);
subplot(2,2,2);
imhist(text, 255);
subplot(2,2,3);
im2bw(text, threshold/255);
title('Własnoręcznie dobrany próg');
subplot(2,2,4);
im2bw(text, thresh);
title(['Próg dobrany metodą Otsu = ' num2str(uint8(thresh*255))]);

[X, Y] = size(text);
textCopy = text;

N = 20;
a = 0.5;
fifo = reshape(zeros(1,20,'uint8'), 1, 20);

for i = 1:X
    for j = 1:Y
        z = text(i,j);
        % pop and push
        fifo(2:end) = fifo(1: end-1);
        fifo(1) = z;
        if i == 1 && j == 1
            m = z/N;
        else
            m = 1/N * sum(fifo);
        end
        if text(i,j) < a*m
            textCopy(i,j) = 0;
        else
            textCopy(i,j) = 255;
        end
        
    end
end

figure(2);
imshow(textCopy);