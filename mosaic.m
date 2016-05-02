%% mosaic: script to automatically perform the mosaicing task of 2 pictures
function mosaic(img1, img2)
  
  f1 = imread(img1);
  f2 = imread(img2);

  T = find_matching_model(f2, f1);
  T = maketform('projective',T)
  [x y] = tformfwd(T,[1 size(f1,2)], [1 size(f1,1)]);

  xdata = [min(1,x(1)) max(size(f2,2),x(2))];
  ydata = [min(1,y(1)) max(size(f2,1),y(2))];
  f12 = imtransform(f1,T,'Xdata',xdata,'YData',ydata);
  f22 = imtransform(f2, maketform('affine', ... 
    [1 0 0; 0 1 0; 0 0 1]), 'Xdata',xdata,'YData',ydata);
  subplot(1,1,1);
  imshow(max(f12,f22));
end