clearvars; close all; clc;

rice = imread('rice.png');
[X Y] = size(rice);

riceCopy = rice;

for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j, 9, rice, X, Y);
        if rice(i,j) < mean
            riceCopy(i,j) = 0;
        else
            riceCopy(i,j) = 255;
        end
    end
end

figure(1);
subplot(1,2,1);
imshow(rice);
title('Obraz originalny');
subplot(1,2,2);
imshow(riceCopy);
title('Obraz zbinearyzowany');