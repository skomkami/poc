close all; clearvars; clc;

img = imread('dom.png');
edgeDetect = edge(img, 'log');

figure(1);

subplot(1,2,1);
imshow(img);
title('Obraz originalny');
subplot(1,2,2);
imshow(edgeDetect);
title('Detekcja krawędzi');

%% algorytm Canny'ego

edgeDetectCanny = edge(img, 'canny');
edgeDetectCanny2 = edge(img, 'canny', [0.2 0.8]);

figure(2);
subplot(1,2,1);
imshow(edgeDetectCanny);
title('Detekcja Cann''ego z automatycznym doborem parametrów');
subplot(1,2,2);
imshow(edgeDetectCanny2);
title('Detekcja Cann''ego z manualnym doborem parametrów');

%% algorytm LoG

edgeDetectLog = edge(img, 'log');
edgeDetectLog2 = edge(img, 'log', 0.25, 0.83);

figure(3);
subplot(1,2,1);
imshow(edgeDetectLog);
title('Detekcja LoG z automatycznym doborem parametrów');
subplot(1,2,2);
imshow(edgeDetectLog2);
title('Detekcja LoG z manualnym doborem parametrów');

%% algorytm Sobel'a
edgeDetectSobel = edge(img, 'sobel');
edgeDetectSobel2 = edge(img, 'sobel','vertical');

figure(4);
subplot(1,2,1);
imshow(edgeDetectSobel);
title('Detekcja Sobel''a z automatycznym doborem parametrów');
subplot(1,2,2);
imshow(edgeDetectSobel2);
title('Detekcja Sobel''a z manualnym doborem parametrów');