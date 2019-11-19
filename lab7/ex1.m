close all; clearvars; clc;

load MR_data;

locWin = [9 9];

orig = I_noisefree;
n1 = I_noisy1;
n2 = I_noisy2;
n3 = I_noisy3;
n4 = I_noisy4;

figure(1);

subplot(2,3,1);
imshow(orig, []);
title('Noise free original');
subplot(2,3,2);
imshow(n1, []);
title('Noisy 1 original');
subplot(2,3,3);
imshow(n2, []);
title('Noisy 2 original');
subplot(2,3,4);
imshow(n3, []);
title('Noisy 3 original');
subplot(2,3,5);
imshow(n4, []);
title('Noisy 4 original');


orig = convolution(I_noisefree, locWin);
n1 = convolution(I_noisy1, locWin);
n2 = convolution(I_noisy2, locWin);
n3 = convolution(I_noisy3, locWin);
n4 = convolution(I_noisy4, locWin);

figure(2);

subplot(2,3,1);
imshow(orig, []);
title('Noise free convoluted');
subplot(2,3,2);
imshow(n1, []);
title('Noisy 1 convoluted');
subplot(2,3,3);
imshow(n2, []);
title('Noisy 2 convoluted');
subplot(2,3,4);
imshow(n3, []);
title('Noisy 3 convoluted');
subplot(2,3,5);
imshow(n4, []);
title('Noisy 4 convoluted');


orig = bilateral(I_noisefree, locWin);
n1 = bilateral(I_noisy1, locWin);
n2 = bilateral(I_noisy2, locWin);
n3 = bilateral(I_noisy3, locWin);
n4 = bilateral(I_noisy4, locWin);

figure(3);

subplot(2,3,1);
imshow(orig, []);
title('Noise free bilateral filter');
subplot(2,3,2);
imshow(n1, []);
title('Noisy 1 bilateral filter');
subplot(2,3,3);
imshow(n2, []);
title('Noisy 2 bilateral filter');
subplot(2,3,4);
imshow(n3, []);
title('Noisy 3 bilateral filter');
subplot(2,3,5);
imshow(n4, []);
title('Noisy 4 bilateral filter');