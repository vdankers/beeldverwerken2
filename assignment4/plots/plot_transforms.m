function plot_transforms(images)
  addpath('..');

  n_images = size(images,1);

  for i = 1:n_images
    subplot(1,n_images,i);
    imgname = strcat(images(i,:))
    img = imread(imgname);
    im = im2double(rgb2gray(img));

    % Perform hough transformation
    h = hough(im,[0.5 0.8],500,500);

    % Scale it down
    h = h / (max(max(h))/4);
    imshow(h)
    x = xlabel(sprintf('%s %s','Hough transform ',imgname));
    set(x,'Interpreter','latex');
  end
end

