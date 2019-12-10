close all; clearvars; clc;

img = imread('ccl1.png');

figure;
imshow(img);
title('Obraz originalny');

[ySize, xSize] = size(img);

L = 1;
N = 100;
id = 1:N;

for j = 2:ySize
   for i = 2:xSize-1
      if img(j,i) == 0
          continue
      end
      
      neighbours = [img(j-1, i-1) img(j-1, i) img(j-1, i + 1) img(j, i-1)];
      
      if sum(neighbours) == 0
         img(j,i) = L;
         L = L + 1;
      elseif sum(neighbours)
          neighbours = nonzeros(neighbours);
          min_neighbour = min(neighbours);
          max_neighbour = max(neighbours);
          
          % b
          if min_neighbour == max_neighbour
             img(j,i) = min_neighbour;
          %c
          else
              img(j,i) = min_neighbour;
              id = union(min_neighbour, max_neighbour,id);
              
          end          
      end         
      
   end
end

figure;
subplot(1,2,1);
imshow(label2rgb(img));
subplot(1,2,2);
imshow(imread('ccl1Result.png'));

lut = zeros(N);

for i = 1:N
    lut(i) = root(i, id);
end

img2 = img;

for j = 2:ySize
   for i = 2:xSize-1
      if img(j,i) == 0
          continue
      end
      img2(j,i) = lut(img(j,i));    
   end
end

figure;
imshow(label2rgb(img2));