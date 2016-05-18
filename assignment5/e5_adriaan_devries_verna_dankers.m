%% Beeldverwerken assignment 5, week 7
% Team: Adriaan de Vries (10795227), Verna Dankers (10761225)
addpath('attachments');

data = load(fullfile('','omni.mat'));
images = data.images;

cor1 = calc_correlation(images{1}.img,images{2}.img)
fake_cor1 = calc_fake_correlation(images{1}.img,images{2}.img)
equal = 2 - 2*cor1
 
cor2 = calc_correlation(images{45}.img,images{300}.img)
fake_cor2 = calc_fake_correlation(images{45}.img,images{300}.img)
equal = 2 - 2*cor2

cor3 = calc_correlation(images{85}.img,images{6}.img)
fake_cor3 = calc_fake_correlation(images{85}.img,images{6}.img)
equal = 2 - 2*cor3

%% PCA - prepare data for PCA

% Split training and test set
n = 16800;
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

[projection_matrix, principal_components, V] = our_pca2(training_set, 300);


%% PCA - Plot the first 9 PCA vectors as images

for i = 1:9
  subplot(3,3,i)
  imshow(reshape(projection_matrix(i,:),[112 150]),[])
end

%% PCA with SVD


[projection_matrix, principal_components, V] = pca_with_svd(training_set);
%% PCA - Use the pca to reduce dimensions for all vectors

imagestruct = [matrix.images{:}];
positions = vertcat(imagestruct.position);

for i = 1:size(reduced_images,2)
  reduced_images(i).img = flatten_image(reduced_images(i).img);
  reduced_images(i).img = projection_matrix * reduced_images(i).img;
end

%% PCA - Alternative version with SVD

[projection_data, principal_components, V] = pca_with_svd(training_set);

%% PCA - Use built in pca of matlab (to control our own outcome)
[coeff,principal_components] = pca(training_set');
% IM = s(:,1)
% 
% subplot(2,1,1)
% imshow(reshape(IM,[112 150]),[]);
% 
% subplot(2,1,2)
% imshow(reshape(training_set(1,:),[112 150]),[]);