%% houghlines: given an image and its hough transform, draws lines over 
%% the image where they should be according to the hough transform
function lines = houghlines(im, h, thresh)

    % some constants we need
    rhomax = sqrt(size(im,1)^2 + size(im,2)^2);
    nrho = size(h, 1);
    drho =   2* rhomax /(nrho -1);
    dtheta = pi/size(h, 2);

    % thresholding the hough transform with thresh
    BW = im2bw(h, thresh);
    threshedH = h.*BW;
    
    [bwl, nregions] = bwlabel(BW);
    lines = zeros(nregions, 4);
    for n = 1:nregions
        % masking and getting the maximum value and its index of each
        % region
        mask = bwl==n;
        region = mask .* h;
        [M, I] = max(region);
        [~, I2] = max(M);
        maxIndex = [I(I2), I2];
        rho = -rhomax + drho*(maxIndex(1)-1);
        theta = maxIndex(2) * dtheta;
        
        % getting the lines
        [x1, y1, x2, y2] = thetarho2endpoints(theta, rho, size(im, 1), size(im, 2));
        lines(n, :) = [x1, x2, y1, y2];
        
    end

end