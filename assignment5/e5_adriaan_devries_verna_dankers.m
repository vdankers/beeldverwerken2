%% Beeldverwerken assignment 5, week 7
% Team: Adriaan de Vries (10795227), Verna Dankers (10761225)
addpath('attachments');

data = load(fullfile('','omni.mat'));

% if you want to take the edge off the images, specify the width here. It's
% recommended to comment this out instead of using 0 if you don't want to
% change the input.

% edge_to_take_off_width = 0;

data.images = edges_off(data.images, edge_to_take_off_width);
images = data.images;


% this code was used for determining the relationship between the two ways
% of calculating correlation

% cor1 = calc_correlation(images{1}.img,images{2}.img)
% fake_cor1 = calc_fake_correlation(images{1}.img,images{2}.img)
% equal = 2 - 2*cor1
%  
% cor2 = calc_correlation(images{45}.img,images{300}.img)
% fake_cor2 = calc_fake_correlation(images{45}.img,images{300}.img)
% equal = 2 - 2*cor2
% 
% cor3 = calc_correlation(images{85}.img,images{6}.img)
% fake_cor3 = calc_fake_correlation(images{85}.img,images{6}.img)
% equal = 2 - 2*cor3

%% PCA - prepare data for PCA

% Split training and test set
n = size(images{1}.img,1) * size(images{1}.img,2);
m = 300;
m2 = length(images)-m;
training_set = zeros(m,n);
test_set = zeros(m2,n);

for i = 1:m
  training_set(i,:) = flatten_image(images{i}.img);
end

for i = 1:m2
  test_set(i,:) = flatten_image(images{i}.img);
end

%% PCA - Calculate the principal components

[projection_matrix, principal_components, V] = our_pca(training_set, 20);


%% PCA - Plot the first 9 PCA vectors as images

for i = 1:9
  subplot(3,3,i)
  imshow(reshape(projection_matrix(i,:),size(images{1}.img)),[])
end

%% PCA - Use the pca to reduce dimensions for all vectors

imagestruct = [data.images{:}];
positions = vertcat(imagestruct.position);

for i = 1:size(imagestruct,2)
  imagestruct(i).img = flatten_image(imagestruct(i).img);
  imagestruct(i).img = projection_matrix * imagestruct(i).img';
end

%% nearest neighbour
tic
correct = 0;
for i = m+1:size(imagestruct, 2)
  best_match = get_best_match(imagestruct(i), imagestruct(1:m));
  if close_enough(imagestruct(i), best_match)
    correct = correct + 1;
  end
end

accuracy = correct / (size(imagestruct, 2)-m);
disp(accuracy)
toc
%% PCA - Alternative version with SVD

[projection_matrix, principal_components, V] = pca_with_svd(training_set);
