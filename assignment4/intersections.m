%% intersections: given lines in homogeneous coordinate form, returns all their intersections.
function ints = intersections(lines)
    count = 1;
    for i=1:size(lines,1)-1
        for j = i+1:size(lines,1)
            if lines(i,:) * lines(j,:)' ~= 0
                ints(count,:) = cross(lines(i,:)', lines(j,:)')';
                count = count+1;
            end
        end
    end
end