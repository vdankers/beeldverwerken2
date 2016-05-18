%% beautiful_subplot: code we use often to make subplots
function beautiful_plot(X, Y, xlab, ylab, m, n, k, colour)
  if (nargin < 8); colour = 'm' ;
    if (nargin < 7); k = 1 ; 
      if (nargin < 6); n = 1 ; 
        if (nargin < 5); m = 1 ; 
          if (nargin < 4); ylab = '' ; 
            if (nargin < 3); xlab = '' ; end
          end
        end
      end
    end
  end
  
  subplot(m,n,k)
  plot(X, Y, colour)
  x = xlabel(xlab);
  y = ylabel(ylab);
  set(x,'Interpreter','latex');
  set(y,'Interpreter','latex');
end