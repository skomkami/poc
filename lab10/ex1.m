close all; clearvars; clc;

img = imread('knee.png');

figure(1);
imshow(img);

imgSize = size(img);

img = double(img);

coordinates = floor(ginput(1));

% coordinates = [100,300];

segmented = zeros(size(img));
visited = zeros(size(img));

stack = zeros(10000,2);

iStack = 1;
y = coordinates(1);
x = coordinates(2);

stack(iStack,:) = coordinates;
segmented(y,x) = 1;
visited(y,x) = 1;

threshold = 50;

nS = 0;
mV = 0;

while iStack > 0
    coords = stack(iStack,:);
    iStack = iStack - 1;
    
    y = coords(1);
    x = coords(2);
    
    if not((y - 3) > 1 && (y + 3) < imgSize(1) && (x - 3) > 1 && (x + 3) < imgSize(2))
        continue;        
    end
    
    nS = nS + 1;
    mV = (mV*(nS-1) + img(y,x))/nS;

    
    for j = y-1:y+1
        for i = x-1:x+1
            dist = abs(img(j,i)-mV);
            
            if dist < threshold && visited(j,i) == 0
                iStack = iStack + 1;
                stack(iStack,:) = [j,i];
                segmented(j,i) = img(j,i);
            end
            
            visited(j,i) = 1;
        end
    end
end

figure(2);
imshow(segmented);