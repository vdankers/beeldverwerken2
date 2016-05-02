function [model] = find_matching_model(img1, img2)

  % vl_sift requires a matrix of class single therefore rgb2gray() & single()
  f1 = rgb2gray(img1);
  f2 = rgb2gray(img2);

  % Find frames, descriptors and matches
  [frames1, descriptors1] = vl_sift(single(f1));
  [frames2, descriptors2] = vl_sift(single(f2));
  [matches, scores] = vl_ubcmatch(descriptors1, descriptors2);
  
  xy = frames1(:,matches(1,:));
  uv = frames2(:,matches(2,:));  
  
  [model, inliers] = ransac(xy(1:2,:),uv(1:2,:));

end