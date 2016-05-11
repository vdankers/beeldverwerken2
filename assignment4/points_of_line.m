function [pts] = points_of_line[points , line , epsilon]
  % points   - an array containing all points
  % line     - the homogeneous representation of the line
  % epsilon  - the maximum distance

  deltas = points * line;
  pts = [];
  
  for i = 1:length(points)
    if deltas(i) < epsilon:
      pts(i) = points(i,:);
  end
  
end