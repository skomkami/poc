function gradients(img, figNum, m1, m2, gradName)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
imgConv =  uint8(conv2(img, m1, 'same'));

imgConvScale = imgConv + 128;
imgConvAbs = abs(imgConv);

figure(figNum);
subplot(2,2,1);
imshow(img);
title('Obraz originalny');
subplot(2,2,2);
imshow(imgConvScale, []);
title(['Obraz skonwolutowany gradientem ' gradName ' (normalizacja przez skalowanie)']);
subplot(2,2,3);
imshow(imgConvAbs, []);
title(['Obraz skonwolutowany gradientem ' gradName ' (normalizacja przez moduł)']);

imgConv =  uint8(conv2(img, m2, 'same'));

imgConvScale = imgConv + 128;
imgConvAbs = abs(imgConv);

figure(figNum + 1);
subplot(2,2,1);
imshow(img);
title('Obraz originalny');
subplot(2,2,2);
imshow(imgConvScale, []);
title(['Obraz skonwolutowany gradientem ' gradName ' nr2 (normalizacja przez skalowanie)']);
subplot(2,2,3);
imshow(imgConvAbs, []);
title(['Obraz skonwolutowany gradientem ' gradName ' nr2 (normalizacja przez moduł)']);
end

