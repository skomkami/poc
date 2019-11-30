close all; clearvars; clc;

img = imread('kwadraty.png');
edgeDetectCanny = edge(img, 'canny');

[H,theta,rho] = hough(edgeDetectCanny);
P = houghpeaks(H,8);

imshow(H, []);
hold on;
plot(P, 'o');
hold off;

lines = houghlines(edgeDetectCanny, theta, rho, P);
%% lines

figure(2), imshow(edgeDetectCanny), hold on
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


