%% Beeldverwerken assignment 3, week 4
% Team: Adriaan de Vries (10795227), Verna Dankers (10761225)
addpath('attachments');

%% Used vl_feat to find matches for the Nachtwacht images

% Read images
% vl_sift requires a matrix of class single therefore rgb2gray() & single()
f1 = rgb2gray(imread('nachtwacht1.jpg'));
f2 = rgb2gray(imread('nachtwacht2.jpg'));

% Find frames, descriptors and matches
[frames1, descriptors1] = vl_sift(single(f1));
[frames2, descriptors2] = vl_sift(single(f2));
[matches, scores] = vl_ubcmatch(descriptors1, descriptors2);

% Visualize the matches
hold on;
% Display the images next to each other
f1 = padarray(f1, size(f2)-size(f1), 'post');
imshow(cat(2, f1, f2));

% Display lines that show us which markers belong to each other
f1_size = size(f1);
lines = line([frames1(1,matches(1,:)) ; frames2(1,matches(2,:)) + f1_size(2)], ... 
  [frames1(2,matches(1,:)) ; frames2(2,matches(2,:))]) ;
set(lines,'linewidth', 1, 'color', 'b') ;

% Display markers on key points
vl_plotframe(frames1(:,matches(1,:)));
frames2(1,:) = frames2(1,:) + f1_size(2);
vl_plotframe(frames2(:,matches(2,:)));
hold off;