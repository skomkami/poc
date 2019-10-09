imgLena = imread("lena.bmp");
subplot(2,3,1);
figure(1);
imgLena = imresize(imgLena, [128 128], 'bicubic');
imshow(imgLena);

lena31 = imadjust(imgLena,[0 1],[0 31/255]);
subplot(2,3,2);
% figure(2);
imshow(lena31,[]);

lena15 = imadjust(imgLena, [0 1], [0 15/255]);
subplot(2,3,3);
% figure(3);
imshow(lena15,[]);

lena7 = imadjust(imgLena, [0 1], [0 7/255]);
subplot(2,3,4);
% figure(4);
imshow(lena7,[]);

lena3 = imadjust(imgLena, [0 1], [0 3/255]);
subplot(2,3,5);
% figure(5);
imshow(lena3,[]);

lena1 = imadjust(imgLena, [0 1], [0 1/255]);
subplot(2,3,6);
% figure(6);
imshow(lena1,[]);

