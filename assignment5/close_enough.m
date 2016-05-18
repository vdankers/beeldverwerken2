function bool = close_enough(imagestruct1, imagestruct2)
    threshold = 150;
    
    difference = imagestruct1.position - imagestruct2.position;
    distance = sqrt(difference(1)^2 + difference(2)^2);
    if distance > threshold
        bool = 0;
    else
        bool = 1;
    end
    
end