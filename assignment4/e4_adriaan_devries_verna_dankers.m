%% Beeldverwerken assignment 4, week 6
% Team: Adriaan de Vries (10795227), Verna Dankers (10761225)
addpath('attachments');
addpath('plots');

%% Plot hough transforms of several images
images = char('shapes.png', 'szeliski.png', 'billboard.png', 'box.png');

%plot_pictures(images)

%%

% Sample code for performing hough tranformation:
% Read the image and cast it to doubles in gray
% img = imread(imgname);
% im = im2double(rgb2gray(img));
% Perform hough transformation with self determined boundaries for edge
% detection
% h = hough(im,[0.5 0.8],500,500);
% h = h / (max(max(h))/4);

%plot_transforms(images)

%%

% 5 lines added for testing
img = imread(strcat(images(1,:)));
im = im2double(rgb2gray(img));
h = hough(im,[0.5 0.8],500,500);
h = h / (max(max(h))/4);
lines = houghlines(im, h, 1);
%lines = houghlines_dilation(im, h, 1, 10);

imshow(im)
hold on
for n = 1:size(lines,1)
    line(lines(n, 1:2), lines(n, 3:4))
end
hold off

%%

% pythonesque turning logical edge array into a 3 x n array with the
% homogeneous representations of the edgepoints
edges = edge(im, 'canny', [.5 .8]);
k = find(edges);
homopoints = zeros(3, size(k,1));
count = 1;
for i=1:size(edges,1)
   for j = 1:size(edges,2)
       if edges(i,j) == 1
           homopoints(:, count) = [i; j; 1];
           count = count+1;
       end
   end
end



lines = lines_to_hom(lines);
imshow(im)
hold on;
for i = 1:size(lines,1)
  points = points_of_line(homopoints', lines(i,:), 10);
  l = line_through_points(points(:,1:2));
  a = l(1);
  b = l(2);
  c = l(3);
  x = linspace(0,size(im,2));
  y = (a*x - c)/ -b;
  plot(x,y);
end
