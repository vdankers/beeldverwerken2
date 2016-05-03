%% createProjectionMatrix: create a matrix for a projection based on old
% and new positions of key points from the picture
function  projMatrix = createProjectionMatrix(xy, uv)
  
% calculation  of  projection  matrix
  [npoints, xydim] = size(xy);
  uvdim = size(uv, 2);

  xy1 = [xy ones(npoints, 1)];
  
  % Create a identity matrix like pattern of xy1, for example if uvdim == 2:
  Aleft = zeros(uvdim * [npoints xydim + 1]);
  for ii = 1:uvdim
    % 1 based, so -1's at indexes
    Aleft( ...
      (ii - 1) * npoints     + 1 :   ii * npoints, ...
      (ii - 1) * (xydim + 1) + 1 :   ii * (xydim + 1) ...
    ) = xy1;
  end

  % Do the multiplication needed because of lambda
  Aright = -repmat(uv(:), 1, xydim + 1) .* repmat(xy1, uvdim, 1);

  [U S V] = svd([Aleft Aright]);
  projMatrix = reshape(V(:, end), xydim + 1, uvdim + 1);
end
