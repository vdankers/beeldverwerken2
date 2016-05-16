%% calc_fake_correlation: calculate correlation with sum of sqared differences
function correlation = calc_fake_correlation(img1,img2)
  img1 = flatten_image(img1);
  img2 = flatten_image(img2);
  difference = img1 - img2;
  correlation = dot(difference,difference);
end