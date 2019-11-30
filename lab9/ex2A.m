close all; clearvars; clc;

img = zeros(11);
img(7,8) = 1;

[H,theta,rho] = hough(img, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

figure(1);

imshow(H,[]);

title('Przestrzeń Hougha');


img(4,7) = 1;

[H,theta,rho] = hough(img, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

figure(2);

imshow(H,[]);

title('Przestrzeń Hougha dla dwóch 1 w obrazie');


img(3,2) = 1;
img(1,1) = 1;

figure(3);

[H,theta,rho] = hough(img, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

imshow(H, []);

%% odtworzenie prostej;

[H,theta,rho] = hough(img, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

x = 145;
y = 190;

xAxis = 0:0.1:10;
yAxis = (rho(y)-xAxis*cosd(theta(x)))/sind(theta(x));

figure(5);
imshow(img,[]);
hold on;
plot(xAxis+1, yAxis+1);