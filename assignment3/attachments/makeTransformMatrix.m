%% makeTransformMatrix: returns matrix for (affine?) or projective transformation
function matrix = makeTransformMatrix(type, xy, xaya)
  if strcmp(type,'projective')
    matrix = createProjectionMatrix(xy, xaya);
  end 
end