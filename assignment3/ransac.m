%% ransac: return which matching points are consensus
function [bestModel, bestInliers] = ransac(xy, uv)
 
  n = 4;    % minimum number of data values required to fit the model
  k = 10;  % maximum number of iterations allowed in the algorithm
  t = [2;2];% threshold value for determining when data point fits a model
  d = 28;   % number of close points required for model to fit well to data

  iterations = 0;
  bestSize = 10000000;
  
  while iterations < k 
    
    % Randomly select inliers
    randomPerm = randperm(size(xy,2));
    possibleInliers = randomPerm(1:n);
    otherPoints = randomPerm(n+1:end);
    
    % Predict projectivity for this sample of inliers
    projectedPoints = project_points( ...
      uv(:,possibleInliers), ... 
      xy(:,possibleInliers), ...
      uv ...
    );
    
    % For all points that were not inliers, check how well the current
    % model predicts those points. If it's predicted well: add to consensus
    possibleInliersToo = [];
    for i = 1:length(otherPoints)
      abs(xy(:,otherPoints(i)) - projectedPoints(:,otherPoints(i)));
      if abs(xy(:,otherPoints(i)) - projectedPoints(:,otherPoints(i))) < t
        possibleInliersToo(end+1) = otherPoints(i);
      end
    end
    
    if length(possibleInliersToo) > d
      % We found a pretty good model, let's register how good it is
      consensus = cat(2,possibleInliers,possibleInliersToo);
      matches = cat(2,uv(:,consensus));
      matches2 = cat(2,xy(:,consensus));
      projectedPoints = project_points(matches, matches2, matches);
      currentSize = length(consensus);
        
      % If its error is lower than the best up till now, this
      % is our new final candidate
      if currentSize < bestSize
        bestSize = currentSize;
        bestInliers = consensus;
        bestModel = createProjectionMatrix(matches',matches2');
      end
    end
    
    iterations = iterations + 1;
  end
end