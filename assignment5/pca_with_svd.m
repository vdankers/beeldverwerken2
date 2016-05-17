function [proj_data, Princ_comp, V] = pca_with_svd(X)
    [~, n] = size(X);
    mn =  mean(X,2);
    data = X - repmat(mn, 1, n);
    
    Y = (1/(sqrt(n-1))) * data';
    
    [~, S, Princ_comp] = svd(Y);

    S = diag(S);
    V = S .* S;
    
    proj_data = Princ_comp' * data;
end