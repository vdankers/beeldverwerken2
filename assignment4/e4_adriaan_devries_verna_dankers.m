%% Beeldverwerken assignment 4, week 6
% Team: Adriaan de Vries (10795227), Verna Dankers (10761225)
addpath('attachments');
%%
h = hough((rgb2gray(imread('shapes.png'))),[0.5 0.8],500,500);
h = h / (max(max(h))/4);
imshow(h)
