%% lines_to_hom: transform lines defined by points to homogeneous coordinates
function [newlines] = lines_to_hom(lines)
    
  newlines = zeros(size(lines,1),3);
  
  for n = 1:size(lines,1)
    a = lines(n,:);
    a(1)
    l = cross([a(1) a(3) 1],[a(2) a(4) 1]);
    l = l / sqrt(l(1)^2 + l(2)^2);
    newlines(n,:) = l;
  end

end