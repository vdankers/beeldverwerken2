function bestmatch = best_match(imstruct, database)
    bestmatch = zeros(size(database(1)));
    bestcorrelation = 0;
    for i = 1: size(database,2)
        correlation = imstruct.img' * database(i).img;
        if correlation > bestcorrelation
            bestmatch = database(i);
            bestcorrelation = correlation;
        end
    end

end