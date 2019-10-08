clearvars

%% sekcja 1
info1 = imfinfo("lena.bmp")
info2 = imfinfo("lena.jpg")

%% sekcja 2
figure(1)
imgdata1 = imread("lena.bmp");
img1 = imshow(imgdata1);
figure(2)
img2 = imshow(imread("lena.jpg"));

%% sekcja 3
grayImage = rgb2gray(imgdata1);
figure(3)
imshow(grayImage);
imwrite(grayImage, "lena_gray.bmp");
%% sekcja 4
figure(4)
colormap gray;
mesh(grayImage);

%% sekcja 5
figure(5)
plot(imgdata1(10,:));
figure(6)
plot(imgdata1(:, 10));

%% sekcja 6
