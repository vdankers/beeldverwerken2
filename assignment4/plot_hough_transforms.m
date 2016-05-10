% Plot shapes.png and its hough transform
subplot(2,4,1)
imgname = 'shapes.png';
img = imread(imgname);
imshow(img)
x = xlabel(imgname);
set(x,'Interpreter','latex');

subplot(2,4,5)
im = im2double(rgb2gray(img));
h = hough(im,[0.5 0.8],500,500);
h = h / (max(max(h))/4);
imshow(h)
x = xlabel(sprintf('%s %s','Hough transform ',imgname));
set(x,'Interpreter','latex');

% Plot szeliski.png and its hough transform
subplot(2,4,2)
imgname = 'szeliski.png'
img = imread(imgname);
imshow(img);
x = xlabel(imgname);
set(x,'Interpreter','latex');

subplot(2,4,6)
im = im2double(rgb2gray(img));
h = hough(im,[0.5 0.8],500,500);
h = h / (max(max(h))/4);
imshow(h)
x = xlabel(sprintf('%s %s','Hough transform ',imgname));
set(x,'Interpreter','latex');

% Plot billboard.png and its hough transform
subplot(2,4,3)
imgname = 'billboard.png';
img = imread(imgname);
imshow(img)
x = xlabel(imgname)
set(x,'Interpreter','latex');

subplot(2,4,7)
im = im2double(rgb2gray(img));
h = hough(im,[0.5 0.8],500,500);
h = h / (max(max(h))/4);
imshow(h)
x = xlabel(sprintf('%s %s','Hough transform ',imgname));
set(x,'Interpreter','latex');

% Plot blox.png and its hough transform
subplot(2,4,4)
imgname = 'box.png';
img = imread(imgname);
imshow(img)
x = xlabel(imgname);
set(x,'Interpreter','latex');

subplot(2,4,8)
im = im2double(rgb2gray(img));
h = hough(im,[0.5 0.8],500,500);
h = h / (max(max(h))/4);
imshow(h)
x = xlabel(sprintf('%s %s','Hough transform ',imgname));
set(x,'Interpreter','latex');