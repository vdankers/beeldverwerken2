%% edges_off: takes the edge of specified width off of the images given
function images = edges_off(images, width)


  % looping through images
  for i = 1:size(images,2)
    % allocating smaller space for the new image
    new_image = zeros(size(images{i},1)-width*2, size(images{i},2)-width*2);
    % getting the new values
    for j = 1:size(images{i}.img, 1)-width*2
      for k = 1:size(images{i}.img, 2)-width*2
        new_image(j,k) = images{i}.img(j+width, k+width);
      end
    end
    images{i}.img = new_image;
  end

end