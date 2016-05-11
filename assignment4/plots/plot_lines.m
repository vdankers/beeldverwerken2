%% plot_lines: plot edges detect by using hough transforms on top of images
function plot_lines(images)
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
    lines = houghlines(im, h, 1);
    %lines = houghlines_dilation(im, h, 1, 10);
    
    % Draw lines on top of image
    imshow(im)
    hold on
    for n = 1:size(lines,1)
        line(lines(n, 1:2), lines(n, 3:4))
    end
    hold off
    
    x = xlabel(sprintf('%s %s','Edges of ',imgname));
    set(x,'Interpreter','latex');
  end
end

