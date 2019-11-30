close all; clearvars; clc;

img = imread('lab112.png');

figure(1);

imshow(img);

figure(2);
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imhist(img, 256);

img = im2bw(img, 37/255);

square = strel('square', 5);
img = imdilate(img, square);

figure(3);

imshow(img);

%% detekcja linii

edgeDetectCanny = edge(img, 'canny');

[H,theta,rho] = hough(edgeDetectCanny);
P = houghpeaks(H,8);
figure(1);

imshow(H, []);
hold on;
plot(P, 'o');
hold off;

lines = houghlines(edgeDetectCanny, theta, rho, P);


figure(4), imshow(edgeDetectCanny), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');


%%  dom.png

img = imread('dom.png');
figure(5);
subplot(1,2,1);
imshow(img);

edgeDetectCanny = edge(img, 'canny');

[H,theta,rho] = hough(edgeDetectCanny);

P = houghpeaks(H,6);

subplot(1,2,2);
imshow(H, []);
hold on;
plot(P, 'o');
hold off;

% lines = houghlines(edgeDetectCanny, theta, rho, P);
% 
% 
% figure(7), imshow(edgeDetectCanny), hold on
% max_len = 0;
% for k = 1:length(lines)
%    xy = [lines(k).point1; lines(k).point2];
%    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%    % Plot beginnings and ends of lines
%    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% 
%    % Determine the endpoints of the longest line segment
%    len = norm(lines(k).point1 - lines(k).point2);
%    if ( len > max_len)
%       max_len = len;
%       xy_long = xy;
%    end
% end
% 
% plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
