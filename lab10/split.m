function split(img, y1, x1, y2, x2)
global treshold limit segRes index MRes;

part = img(y1:y2, x1:x2);
m = mean(part(:));
stdDev = std(part(:));

size = [y2-y1, x2 - x1];

if size(1) > limit && size(2) > limit && stdDev > treshold
    middleY = floor((y1+y2)/2);
    middleX = floor((x1+x2)/2);
    split(img, y1, x1, middleY, middleX) % R1
    split(img, y1, middleX+1, middleY, x2) % R2
    split(img, middleY+1, x1, y2, middleX) % R3
    split(img, middleY+1, middleX+1, y2, x2) % R4   
else
    segRes(y1:y2, x1:x2) = index;
    index = index + 1;
    MRes(y1:y2, x1:x2) = m;
end

end

