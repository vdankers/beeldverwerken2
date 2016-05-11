%% houghlines_dilation: given an image and its hough transform, draws lines over 
%% the image where they should be according to the hough transform
%% using grayscale dilation for maximum detection
function lines = houghlines_dilation(im, h, thresh, nhood_size)

    % some constants we need
    rhomax = sqrt(size(im,1)^2 + size(im,2)^2);
    nrho = size(h, 1);
    drho =   2* rhomax /(nrho -1);
    dtheta = pi/size(h, 2);

    
    % dilation
    dilated = imdilate(h, strel('sphere', nhood_size));
    
    % we get the zeros of the difference to get the indices where the
    % dilation and original are the same, but we get those only where the
    % value of the hough transform is higher than the threshold
    [row, col] = find(~(dilated - h)&h>=thresh);
       
    lines = zeros(size(col,1), 4);
    for n = 1:size(col,1)
        maxIndex = [row(n), col(n)];
        rho = -rhomax + drho*(maxIndex(1)-1);
        theta = maxIndex(2) * dtheta;
        
        % getting the lines
        [x1, y1, x2, y2] = thetarho2endpoints(theta, rho, size(im, 1), size(im, 2));
        lines(n, :) = [x1, x2, y1, y2];
        
        % homogeneous coordinate time
        %lines(n, :) = cross([x1, y1, 1],[x2, y2, 2]);
        %lines(n, :) = lines(n, :) / sqrt(lines(n, 1)^2 + lines(n,2)^2)
        
    end 
end