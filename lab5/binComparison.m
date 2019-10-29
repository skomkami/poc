function binComparison(img, figNumber, threshold)
%BINCOMPARISON Summary of this function goes here
%   Detailed explanation goes here
thresh = graythresh(img);

threshKittler = clusterKittler(img);
threshYen = entropyYen(img);

figure(figNumber);
subplot(3,2,1);
imshow(img);
title('Obraz originalny');
subplot(3,2,2);
imhist(img, 256);

subplot(3,2,3);
im2bw(img, threshold/255);
title(['Własnoręcznie dobrany próg' num2str(threshold)]);
subplot(3,2,4);
im2bw(img, thresh);
title(['Próg dobrany metodą Otsu' num2str(thresh*255)]);

subplot(3,2,5);
im2bw(img, threshKittler/255);
title(['Próg dobrany metodą Kittlera = ' num2str(threshKittler)]);
subplot(3,2,6);
im2bw(img, threshYen/255);
title(['Próg dobrany metodą Yen = ' num2str(threshYen)]);
end

