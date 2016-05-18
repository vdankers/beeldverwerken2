%% our_pca: creates a matrix that reduces dimensionality of data with maximum expressiveness
function [projection_matrix, Vectors, Values] = our_pca(X, d)
  % Subtract mean for every 'measurement type'
  [~, n] = size(X);
  X_mean =  mean(X,2);
  
  X = X - repmat(X_mean, 1, n);
  
  % Calc covariance matrix and its first d eigenvalues and eigenvectors
  C = (1 / (n-1)) * (X * X');
  [Vectors, Values] = eigs(C, d);
  
  % we only need a vector, not a matrix
  Values = diag(Values);

  % Vectors and eigenvalues in decreasing order
  [~, indices] = sort(Values, 'descend');
  Values = Values(indices);
  Vectors = Vectors(:,indices);
  
  % and finally, we make the projection matrix
  projection_matrix = Vectors' * X;
end