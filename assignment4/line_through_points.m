function l = line_through_points(points)
  centroid = sum(points)/size(points,1)
  
  points2 = zeros(size(points,1),2);
  
  for i = 1:size(points,1)
    points(i,:);
    points2(i,:) = points(i,:) - centroid;
  end
  
  matrix = cov(points2(:,1),points2(:,2)) % REPLACE WITH OWN CODE FOR COV MATRIX
  
  [V,D] = eig(matrix)
  [max_eigenvalue,ind] = max(D(:))
  [i,j] = ind2sub(size(D),ind);
  max_eigenvector = V(:,j)
  
  n = [-max_eigenvector(2),max_eigenvector(1)]
  projc = ((centroid * max_eigenvector) / ... 
    (max_eigenvector' * max_eigenvector)) * max_eigenvector
  orth_vec = centroid' - projc;
  d = sqrt(orth_vec(1)^2 + orth_vec(2)^2)
  
  if centroid(2) < 0
    d = -d;
  end
  
  l = [n, -d]
end 