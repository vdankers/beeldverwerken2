function [projected_data, PC, V] = our_pca2(data, d)
  % Subtract mean for every 'measurement type'
  [~, n] = size(data);
  mn =  mean(data,2);
  
  data = data - repmat(mn, 1, n);
  
  % Calc covariance matrix and its eigenvalues and eigenvectors
  C = (1 / (n-1)) * (data * data');
  [PC, V] = eigs(C, d);
  V = diag(V);
  % Vectors and eigenvalues in decreasing order
  [~, indices] = sort(-1*V);
  PC = PC(:,indices);
  V = V(indices);
  
  projected_data = PC' * data;
end