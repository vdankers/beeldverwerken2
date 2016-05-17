%% Beeldverwerken assignment 5, week 7
% Team: Adriaan de Vries (10795227), Verna Dankers (10761225)
addpath('attachments');

matrix = load(fullfile('','omni.mat'));

cor1 = calc_correlation(matrix.images{1}.img,matrix.images{2}.img)
fake_cor1 = calc_fake_correlation(matrix.images{1}.img,matrix.images{2}.img)
equal_fake = 2 - 2*cor1
 
cor2 = calc_correlation(matrix.images{45}.img,matrix.images{300}.img)
fake_cor2 = calc_fake_correlation(matrix.images{45}.img,matrix.images{300}.img)
equal_fake = 2 - 2*cor2

cor3 = calc_correlation(matrix.images{85}.img,matrix.images{6}.img)
gitfake_cor3 = calc_fake_correlation(matrix.images{85}.img,matrix.images{6}.img)
equal_fake = 2 - 2*cor3

%% PCA

% Split training and test set
n = 16800;
m = 300;
m2 = length(matrix.images)-m;
training_set = zeros(m,n);
test_set = zeros(m2,n);

for i = 1:m
  training_set(i,:) = flatten_image(matrix.images{i}.img);
end

for i = 1:m2
  test_set(i,:) = flatten_image(matrix.images{i}.img);
end

%% Own PCA method

[P, E] = our_pca(training_set')

%% PCA2 for testing
imagestruct = [matrix.images{:}];
positions = vertcat(imagestruct.position);

[projection_matrix, principal_components, V] = our_pca2(training_set, 50);

% using the pca to reduce dimensions for all vectors
for i = 1:size(imagestruct,2)
  imagestruct(i).img = flatten_image(imagestruct(i).img);
  imagestruct(i).img = projection_matrix * imagestruct(i).img';
end

%% PCA with SVD

[projection_matrix, principal_components, V] = pca_with_svd(training_set);



%% Built in pca of matlab: (voor controle)
[coeff,s] = pca(training_set');
IM = s(:,1)

subplot(2,1,1)
imshow(reshape(IM,[112 150]),[]);

subplot(2,1,2)
imshow(reshape(training_set(1,:),[112 150]),[]);