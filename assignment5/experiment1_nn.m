%% NN - Experiment with the number of PCA components used when positioning

Xdata = [10:2:50];
Ydata = [10:2:50];
Ydata2 = [10:2:50];

counter = 1;
for i = 10:2:50
  [projection_matrix, principal_components, V] = our_pca(training_set, i);
  imagestruct = reduce_dimensions(imagestruct, projection_matrix);
  [accuracy, time] = test_nearest_neighbours(m, imagestruct);
  Ydata(counter) = accuracy;
  Ydata2(counter) = time;
  counter = counter + 1;
  
  % reset imagestruct
  imagestruct = [data.images{:}];
end

subplot(2,1,1)
plot(Xdata,Ydata);
x = xlabel('$d$');
y = ylabel('$Accuracy$');
set(x,'Interpreter','latex');
set(y,'Interpreter','latex');

subplot(2,1,2)
plot(Xdata,Ydata2);
x = xlabel('$d$');
y = ylabel('Time in $s$');
set(x,'Interpreter','latex');
set(y,'Interpreter','latex');