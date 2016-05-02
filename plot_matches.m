%% plot_matches: plot the given matching keypoints on top of images
function plot_matches(f1, f2, frames1, frames2)

  % Visualize the matches
  hold on;
  % Display the images next to each other
  f1 = padarray(f1, size(f2)-size(f1), 'post');
  imshow(cat(2, f1, f2));

  % Display lines that show us which markers belong to each other
  f1_size = size(f1);
  lines = line([frames1(1,:) ; frames2(1,:) + f1_size(2)], ... 
    [frames1(2,:) ; frames2(2,:)]) ;
  set(lines,'linewidth', 1, 'color', 'b') ;

  % Display markers on key points
  vl_plotframe(frames1);
  frames2(1,:) = frames2(1,:) + f1_size(2);
  vl_plotframe(frames2);
  hold off;
  
end