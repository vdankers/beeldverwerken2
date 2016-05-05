%% thetarho2endpoints: converts theta and rho into endpoints of lines
function [x1, y1, x2, y2] = thetarho2endpoints(theta, rho, rows, cols)

    x1 = 0;
    y1 = - (rho + x1*sin(theta)) / cos(theta);
    
    x2 = cols;
    y2 = - (rho + x2*sin(theta)) / cos(theta);
    
    if abs(y1-y2) > 2*cols
        y1 = 0;
        x1 = (rho * y2 * cos(theta))/sin(theta);
        
        y2 = rows;
        x2 = (rho * y2 * cos(theta))/sin(theta);
    end
end