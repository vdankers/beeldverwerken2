%% flatten_image: flattens an image from matrix to vector
function vector = flatten_image(image)
  len = size(image,1)*size(image,2);
  vector = reshape(image, [1, len]);
%   K = sqrt(dot(vector,vector));
%   vector = (1/K) * vector;
end