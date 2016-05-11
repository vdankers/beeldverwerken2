%% cov_matrix: compute covariance matrix 
function [cov_matrix] = compute_cov_matrix(X,Y)
  v1 = var(X);
  v2 = var(Y);
  u1 = mean(X);
  u2 = mean(Y);
  
  cov_matrix = [
    (v1 - u1)^2     (v1-u1)*(v2-u2)
    (v1-u1)*(v2-u2) (v2-u2)^2
  ];
end