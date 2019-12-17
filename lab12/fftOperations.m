function fftOperations(img)

Y = fft2(img);
Y = fftshift(Y);
A = abs(Y);
A = log10(A+1);

F = angle(Y.*(A>0.0001));

figure;
subplot(1,3,1);
imshow(img);
title('Obraz originalny');
subplot(1,3,2);
imshow(A,[]);
title('Amplituda');
subplot(1,3,3);
imshow(F);
title('Faza');

%% odwrotna

Y = ifftshift(Y);

reverseFFT = ifft2(Y);

figure;
imshow(reverseFFT, []);
title('Po transformacie odwrotnej');


end

