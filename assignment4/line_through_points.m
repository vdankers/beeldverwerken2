function l = line_through_points(points)
  % Calculate centroid
  centroid = sum(points)/size(points,1);
  
  % p' = p - c
  points2 = zeros(size(points,1),2);
  for i = 1:size(points,1)
    points(i,:);
    points2(i,:) = points(i,:) - centroid;
  end
  
  % Create covariance matrix
  matrix = cov(points2(:,1),points2(:,2)); % REPLACE WITH OWN CODE FOR COV MATRIX
  
  % Find eigenvector of largest eigenvalue
  [V,D] = eig(matrix);
  [max_eigenvalue,ind] = max(D(:));
  [i,j] = ind2sub(size(D),ind);
  max_eigenvector = V(:,j);
  
  % Calculate normal vector
  n = [-max_eigenvector(2),max_eigenvector(1)]
  
  % Calculate delta
  projc = ((centroid * max_eigenvector) / ... 
    (max_eigenvector' * max_eigenvector)) * max_eigenvector;
  orth_vec = centroid' - projc;
  d = sqrt(orth_vec(1)^2 + orth_vec(2)^2);
  
  if n(1)*n(2) < 0
    d = -d;
  end
  
  l = [n, -d];
end 