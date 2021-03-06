%% Beeldverwerken assignment 5, week 7
% Team: Adriaan de Vries (10795227), Verna Dankers (10761225)
addpath('attachments');

data = load(fullfile('','omni.mat'));

% if you want to take the edge off the images, specify the width here. It's
% recommended to comment this out instead of using 0 if you don't want to
% change the input.

% edge_to_take_off_width = 0;

% data.images = edges_off(data.images, edge_to_take_off_width);
images = data.images;
imagestruct = [data.images{:}];
positions = vertcat(imagestruct.position);

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

%% 2. PCA - prepare data for PCA

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

%% 2. PCA - Calculate the principal components

[projection_matrix, principal_components, V] = our_pca(training_set, 200);


%% 2. PCA - Plot the first 9 PCA vectors as images

for i = 1:9
  subplot(3,3,i)
  imshow(reshape(projection_matrix(i,:),size(images{1}.img)),[])
end

%% 2. PCA - Plot the first 50 eigenvalues

scatter(2:50,V(2:50))
x = xlabel('nth eigenvalue');
set(x,'Interpreter','latex');

%% 2. PCA - Use the pca to reduce dimensions for all vectors

imagestruct = reduce_dimensions(imagestruct, projection_matrix);

%% 2 PCA - Compare the speedup relative to the naive implementation for image differences

naive_times = [1:50];
reduced_times = [1:50];

for i = 1:50
  % Naive implementation
  tic
  for j = 1:length(images)
    calc_correlation(images{i}.img,images{j}.img); 
  end
  naive_times(i) = toc;

  % Check image similarity with reduced data
  tic
  for j = 1:length(images)
    calc_correlation(imagestruct(i).img,imagestruct(j).img);
  end
  reduced_times(i) = toc;
end

disp(mean(naive_times))
disp(mean(reduced_times))

%% (PCA - Alternative version with SVD)
[projection_matrix, principal_components, V] = pca_with_svd(training_set);

%% 3. Nearest Neighbour - Calculate accuracy

[accuracy, time] = test_nearest_neighbours(m, imagestruct)

%% 3. Nearest Neighbour - Examine dimensions and accuracy

% reset data for the experiments
images = data.images;
imagestruct = [data.images{:}];
positions = vertcat(imagestruct.position);

experiment1_nn