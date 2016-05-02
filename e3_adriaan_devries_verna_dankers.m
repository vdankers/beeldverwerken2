%% Beeldverwerken assignment 3, week 4
% Team: Adriaan de Vries (10795227), Verna Dankers (10761225)
addpath('attachments');
run('vlfeat-0.9.20/toolbox/vl_setup');

%% Used vl_feat to find matches for the Nachtwacht images

% Read images
% vl_sift requires a matrix of class single therefore rgb2gray() & single()
f1 = rgb2gray(imread('nachtwacht1.jpg'));
f2 = rgb2gray(imread('nachtwacht2.jpg'));

% Find frames, descriptors and matches
[frames1, descriptors1] = vl_sift(single(f1));
[frames2, descriptors2] = vl_sift(single(f2));
[matches, scores] = vl_ubcmatch(descriptors1, descriptors2);

plot_matches(f1, f2, frames1, frames2, matches)

%%

xy = frames1(:,matches(1,:));
xy = xy(1:2,1:4)

uv = frames2(:,matches(2,:));
uv = uv(1:2,1:4)

projectionMatrix = createProjectionMatrix(xy',uv')
