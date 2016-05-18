%% get_best_match: ...
function best_match = get_best_match(imstruct, database)    
  % get the best match
  best_match = zeros(size(database(1)));
  bestcorrelation = 0;
  
  for i = 1: size(database,2)
    correlation = calc_correlation(imstruct.img , database(i).img);
    if correlation > bestcorrelation
       best_match = database(i);
       bestcorrelation = correlation;
       best_index = i;
    end
  end
  
end