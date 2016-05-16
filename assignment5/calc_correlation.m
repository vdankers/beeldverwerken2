%% calc_correlation: returns the correlation between two images
function correlation = calc_correlation(img1, img2)
  img1 = flatten_image(img1);
  img2 = flatten_image(img2);
  correlation = dot(img1, img2);
end