function plot_pictures(images)
  addpath('..');

  n_images = size(images,1);

  for i = 1:n_images
    subplot(1,n_images,i);
    imgname = strcat(images(i,:));
    img = imread(imgname);
    imshow(img)
    x = xlabel(imgname);
    set(x,'Interpreter','latex');
  end
end

