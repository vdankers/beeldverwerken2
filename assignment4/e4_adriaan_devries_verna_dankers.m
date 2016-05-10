%% Beeldverwerken assignment 4, week 6
% Team: Adriaan de Vries (10795227), Verna Dankers (10761225)
addpath('attachments');

%% Plot hough transforms of several images
plot_hough_transforms

%%

  lines = houghlines(im, h, 1);
% imshow(im)
% hold on
% for n = 1:size(lines,1)
%     line(lines(n, 1:2), lines(n, 3:4))
% end