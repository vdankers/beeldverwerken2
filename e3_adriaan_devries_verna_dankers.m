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

plot_matches(f1, f2, frames1(:,matches(1,:)), frames2(:,matches(2,:)))

%% Use projection matrix to calculate matching keypoints

% Select a few matches to base the projection matrix on
xy = frames1(:,matches(1,:));
smallxy = xy(1:2,35:40)

uv = frames2(:,matches(2,:));
smalluv = uv(1:2,35:40)

% Create projection matrix and calculate matching keypoints
projectionMatrix = createProjectionMatrix(smalluv',smallxy')
newuv = [uv(1:2,:); repmat([1],[1,size(uv,2)])]
projectedFrames = newuv' * projectionMatrix;

% Divide every point by its lambda
for i = 1:size(projectedFrames,1)
  projectedFrames(i,:) = projectedFrames(i,:) / projectedFrames(i,3);
end

plot_matches(f1, f2, projectedFrames(:,:)', newuv)

%% Use RANSAC to remove bad matches

xy = frames1(:,matches(1,:));
uv = frames2(:,matches(2,:));    

% Apply ransac to reduce matching points
[model, inliers] = ransac(xy(1:2,:),uv(1:2,:));

plot_matches(f1, f2, xy(:,inliers), uv(:,inliers));