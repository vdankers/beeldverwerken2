%% test_nearest_neighbours: calculate accuracy on test data
function [accuracy, time] = test_nearest_neighbours(m, imagestruct)
  tic
  correct = 0;
  for i = m + 1:size(imagestruct, 2)
    best_match = get_best_match(imagestruct(i), imagestruct(1:m));
    if close_enough(imagestruct(i), best_match)
      correct = correct + 1;
    end
  end

  accuracy = correct / (size(imagestruct, 2)-m);
  disp(accuracy)
  time = toc  
end