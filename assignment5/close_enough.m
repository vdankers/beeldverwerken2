%% close_enough: checks whether two images were taken within 'threshold' of
%% eachother
function bool = close_enough(imagestruct1, imagestruct2)
  % change this to be more or less strict for correctness
  threshold = 150;

  % calculates the distance
  difference = imagestruct1.position - imagestruct2.position;
  distance = sqrt(difference(1)^2 + difference(2)^2);

  if distance > threshold
    bool = 0;
  else
    bool = 1;
  end  
end