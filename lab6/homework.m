close all; clearvars; clc;

imgNoise = imread('lenaSzum.bmp');

imgFiltered = medfilt2(imgNoise, [7 7]);

figure(1);
subplot(1,2,1);
imshow(imgNoise);
title('Obraz originalny');
subplot(1,2,2);
imshow(imgFiltered);
title('Obraz po filtracji medianowej 7x7');

imgCopy = imgNoise;
maxFilter = 7;
[Y, X] = size(imgNoise);

for j = 4:Y-4
    for i = 4:X-4
        initFilter = 3;
        imgCopy(j, i) = uint8(phaseA(imgNoise, i, j, initFilter, maxFilter));
    end
end

figure(2);
subplot(1,2,1);
imshow(imgNoise);
title('Obraz originalny');
subplot(1,2,2);
imshow(imgCopy);
title('Obraz po filtracji medianowej adaptacyjnej 7x7');

function part = trim(img, pixelX, pixelY, range)
    range = floor(range/2);
    part = img(pixelY-range:pixelY+range, pixelX-range:pixelX+range);
    part = double(part);
end

function z = phaseA(img, xCord, yCord, filter, maxFilter)
    part = trim(img, xCord, yCord, filter);
    part = part(:);
    z_min = min(part);
    z_max = max(part);
    z_med = median(part);
    
    a1 = z_med - z_min;
    a2 = z_med - z_max;
    
    if logical(a1 > 0) & logical(a2 < 0)
        z = phaseB(z_min, z_max, z_med, img(yCord, xCord));
    else
        filter = filter + 2;
        if filter <= maxFilter
            z = phaseA(img, xCord, yCord, filter, maxFilter);
        else
            z = z_med;
        end
    end
end

function z = phaseB(z_min, z_max, z_med, z_xy)
    B1 = z_xy - z_min;
    B2 = z_xy - z_max;
    
    if (B1 > 0) && (B2 < 0)
        z = z_xy;
    else
        z = z_med;
    end
end