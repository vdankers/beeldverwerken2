%% project_points: project a set of points based on a few good examples
function projectedPoints = project_points(smalluv, smallxy, uv)
  % Create projection matrix
  projectionMatrix = createProjectionMatrix(smalluv', smallxy');
  uv = [uv; repmat([1],[1,size(uv,2)])];
  
  % Project points
  projectedPoints = uv' * projectionMatrix;
    
  % Divide every point by its lambda
  for i = 1:size(projectedPoints,1)
    projectedPoints(i,:) = projectedPoints(i,:) / projectedPoints(i,3);
  end
        
  projectedPoints = projectedPoints(:,1:2)';
end