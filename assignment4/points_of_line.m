%% points_of_line: return points within epsilon distance of the line
function [pts] = points_of_line(points , line , epsilon)
  % points   - an array containing all points
  % line     - the homogeneous representation of the line
  % epsilon  - the maximum distance
  deltas = line * points';
  pts = [];
  
  for i = 1:size(points,1)
    if abs(deltas(i)) < epsilon
      pts(size(pts,1)+1,:) = points(i,:);
    end
  end
  
end