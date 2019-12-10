close all; clearvars; clc;
global treshold limit segRes index MRes;

treshold = 0.03;
limit = 5;
index = 1;

img = imread('umbrealla.png');

figure(1);
imshow(img);

img = rgb2hsv(img);
img = img(:,:,1);

segRes = zeros(size(img));
MRes = zeros(size(img));

img = double(img);

imgSize = size(img);

split(img,1,1,imgSize(1), imgSize(2));

i = 1;

SE = strel('square',3);

while i <= index
   IB = segRes == i;
   
   if any(IB,'all')
       [yF, xF] = find(IB, 1, 'first');
       IBdilate = imdilate(IB, SE);
       IBsub = imsubtract(IBdilate, IB);
       mul = IBsub .* segRes;
       nonZeros = nonzeros(mul);
       uni = unique(nonZeros); % ??
       
       comb = 0;
       for n = 1:numel(uni)
           IBS = segRes == uni(n);
           
           [yFS, xFS] = find(IBS, 1, 'first');
           
           colDiffAbs = abs(MRes(yF,xF) - MRes(yFS, xFS));
           if colDiffAbs < 3/255
               segRes(IBS) = i;
               comb = 1;
           end         
       end
       if comb == 0
           i = i + 1;
       end   
   else
       i = i + 1;
       continue       
   end
end

U = unique(segRes);

for i = 1:numel(U)
    C = segRes == U(i);
    if sum(C) < limit
       segRes(C) = 0; 
    end
end

U = unique(segRes);

for ii = 1:numel(U)
    C = segRes == U(ii);
    segRes(C) = ii;
end

final = label2rgb(segRes);

figure(3);
imshow(final);






