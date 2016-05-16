function [P, E] = our_pca(data)
  % Subtract mean for every 'measurement type'
  [m, n] = size(data);
  mn =  mean(data,2);
  
  for i = 1:n
    data(:,i) = data(:,i) - mn;
  end
  
  % Calc covariance matrix and its eigenvalues and eigenvectors
  C = (1 / (m-1)) * (data * data');
  [P,E] = eigs(C);
  
  % Vectors and eigenvalues in increasing order
  indices = fliplr([1:size(P,2)]);
  P = P(:,indices);
  E = E(:,indices);
end