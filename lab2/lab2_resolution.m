ImgLena = imread("lena.bmp");
figure(1);
imshow(ImgLena);

%% 256
lena256 = imresize(ImgLena, [256 256], 'bicubic');
figure(2);
imshow(lena256, 'InitialMagnification', 200);

%% 128
lena128 = imresize(ImgLena, [128 128], 'bicubic');
figure(3);
imshow(lena128, 'InitialMagnification', 400);

%% 64
lena64 = imresize(ImgLena, [64 64], 'bicubic');
figure(4);
imshow(lena64, 'InitialMagnification', 800);