
Img = imread("parrot.bmp");
figure(1);
imshow(Img);

nearest_neighbour = imresize(Img, 1.5, 'nearest');
figure(2);
imshow(nearest_neighbour);
bilinear = imresize(Img, 1.5, 'bilinear');
figure(3);
imshow(bilinear);
bicubic = imresize(Img, 1.5, 'bicubic');
figure(4);
imshow(bicubic);