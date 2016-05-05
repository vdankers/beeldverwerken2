%% Beeldverwerken assignment 4, week 6
% Team: Adriaan de Vries (10795227), Verna Dankers (10761225)
addpath('attachments');
%%
im = im2double(rgb2gray(imread('shapes.png')));
h = hough(im,[0.5 0.8],500,500);
h = h / (max(max(h))/4);
%imshow(h)
lines = houghlines(im, h, 1);
imshow(im)
hold on
for n = 1:size(lines,1)
    line(lines(n, 1:2), lines(n, 3:4))
end