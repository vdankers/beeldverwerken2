%% reduce_dimensions: use the PCA projection matrix to reduce dimensions of data
function imagestruct = reduce_dimensions(imagestruct, projection_matrix)
  for i = 1:size(imagestruct,2)
    imagestruct(i).img = flatten_image(imagestruct(i).img);
    imagestruct(i).img = projection_matrix * imagestruct(i).img';
  end
end