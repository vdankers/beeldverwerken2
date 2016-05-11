addpath('attachments');

% Plot shapes.png and its hough transform
subplot(1,4,1)
imgname = 'shapes.png';
img = imread(imgname);
imshow(img)
x = xlabel(imgname);
set(x,'Interpreter','latex');

% Plot szeliski.png and its hough transform
subplot(1,4,2)
imgname = 'szeliski.png'
img = imread(imgname);
imshow(img);
x = xlabel(imgname);
set(x,'Interpreter','latex');

% Plot billboard.png and its hough transform
subplot(1,4,3)
imgname = 'billboard.png';
img = imread(imgname);
imshow(img)
x = xlabel(imgname)
set(x,'Interpreter','latex');

% Plot blox.png and its hough transform
subplot(1,4,4)
imgname = 'box.png';
img = imread(imgname);
imshow(img)
x = xlabel(imgname);
set(x,'Interpreter','latex');

%%



