%% thetarho2endpoints: converts theta and rho into endpoints of lines
function [x1, y1, x2, y2] = thetarho2endpoints(theta, rho, rows, cols)
    theta = theta+pi/2;
    if cos(theta) ~= 0
    y1 = 0;
    x1 = - (rho + y1*sin(theta)) / cos(theta);
    
    y2 = cols;
    x2 = - (rho + y2*sin(theta)) / cos(theta);
    else
        x1 = 0;
        y1 = (rho * x1 * cos(theta))/sin(theta);
        
        x2 = rows;
        y2 = (rho * x2 * cos(theta))/sin(theta);
    end
    
    
    
    
    
end