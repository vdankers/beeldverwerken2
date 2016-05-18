%% get_best_match: returns the image from the database that correlates most
%% with given image
function best_match = get_best_match(imstruct, database)    
  % instantiating variables
  best_match = zeros(size(database(1)));
  bestcorrelation = 0;
  
  % go through database, every time a better match pops up than the best up
  % to that point, it's the new best match.
  for i = 1: size(database,2)
    correlation = calc_correlation(imstruct.img , database(i).img);
    if correlation > bestcorrelation
       best_match = database(i);
       bestcorrelation = correlation;
    end
  end
  
end