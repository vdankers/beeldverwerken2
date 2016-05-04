%% hough: constructs a Hough  transform  for  finding lines in an image
function h = hough(im, Thresh , nrho , ntheta)
  % im      - The  grey  scale  image to be  transformed
  % Thresh  - A vector giving the upper and lower threshold values for edge()
  % nrho    - Number of quantised levels of rho to use
  % ntheta  - Number  of  quantised  levels  of  theta to use
  
  imageSize = size(im);
  
  % detect edges
  edges = edge(im, 'canny',Thresh);

  rhomax = sqrt(imageSize(1)^2 + imageSize(2)^2);   % maximum possible value of rho.
  
  drho =   2* rhomax /(nrho -1);     % increment in rho between successive
  % entries  in the  accumulator  matrix.
  % Remember  we go  between +-rhomax.

  dtheta = pi/ntheta;                 % The  increment  in theta  between  entries.
  thetas = [0: dtheta :(pi-dtheta )]; % Array  of theta  values  across  the
  
  % accumulator  matrix.
  accMatrix = zeros([nrho , ntheta]);
  
  % for  each x and y of  nonzero  edge  values calculate rho for all
  % thetas
  for i = 1:imageSize(1)
    for j = 1:imageSize(2)
      if edges(i,j) == 1 
        for k = 1:length(thetas)
          theta = thetas(k);
          rho = j * sin(theta) - i * cos(theta);
          rhoindex = round(rho/drho + nrho /2);
          thetaindex = round(theta/dtheta + 1);
          accMatrix(rhoindex,thetaindex) = accMatrix(rhoindex,thetaindex) + 1;
        end
      end
    end
  end
  
  h = accMatrix;
end