%% parrot

ImgParrot = imread("parrot.bmp");
figure(1);
imshow(ImgParrot);

nearestNeighbourParrot = imresize(ImgParrot, [100 200], 'nearest');
figure(2);
imshow(nearestNeighbourParrot);
bilinearParrot = imresize(ImgParrot, [100 200], 'bilinear');
figure(3);
imshow(bilinearParrot);
bicubicParrot = imresize(ImgParrot, [100 200], 'bicubic');
figure(4);
imshow(bicubicParrot);

%% chessboard

ImgChessboard = imread("chessboard.bmp");
figure(5);
imshow(ImgChessboard);

nearestNeighbourChessboard = imresize(ImgChessboard, [100 200], 'nearest');
figure(6);
imshow(nearestNeighbourChessboard);
bilinearChessboard = imresize(ImgChessboard, [100 200], 'bilinear');
figure(7);
imshow(bilinearChessboard);
bicubicChessboard = imresize(ImgChessboard, [100 200], 'bicubic');
figure(8);
imshow(bicubicChessboard);

%% clock

ImgClock = imread("clock.bmp");
figure(9);
imshow(ImgClock);

nearestNeighbourClock = imresize(ImgClock, [100 200], 'nearest');
figure(10);
imshow(nearestNeighbourClock);
bilinearClock = imresize(ImgClock, [100 200], 'bilinear');
figure(11);
imshow(bilinearClock);
bicubicClock = imresize(ImgClock, [100 200], 'bicubic');
figure(12);
imshow(bicubicClock);