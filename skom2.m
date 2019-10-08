%% secja 1
figure(1)
imgdata1 = imread("lena_gray.bmp");
[lenaIndex, map] = gray2ind(imgdata1, 256);
imshow(lenaIndex, map);
%% sekcja 2
figure(2)
map2 = colormap(autumn(5))
imshow(lenaIndex, map2);
