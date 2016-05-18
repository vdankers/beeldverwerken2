function bestmatch = best_match(imstruct, database)    
    % get the best match
    bestmatch = zeros(size(database(1)));
    bestcorrelation = 0;
    for i = 1: size(database,2)
        correlation = calc_correlation(imstruct.img , database(i).img);
        if correlation > bestcorrelation
            bestmatch = database(i);
            bestcorrelation = correlation;
            bestindex = i;
        end
    end
end