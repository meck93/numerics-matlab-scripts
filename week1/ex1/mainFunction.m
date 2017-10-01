clear all
close all

% Compute the nearest neighbor algorithm on the test MINST set
% Fix the input size with the two parameters of the function 

% Set the test size to use
test_size = 30;

% Set the training size to use
training_size = 1000;

% Determine whether you want to use 
% 1. K-nearest or nearest neighbor algorithm
% 2. Blur or no blur
% If you choose k-nearest, make sure to also adjust the variable for k
kNearest = true;
blur = true;
numberOfNeighbors = 3;

if (kNearest)
    if (blur)
        disp('Test K-Nearest With Blur');
        kNearestNeighborWithBlur(numberOfNeighbors, test_size, training_size);
    else
        disp('Test K-Nearest Neighbor')
        kNearestNeighbor(numberOfNeighbors,test_size,training_size);
    end
else
    disp('Test Nearest Neighbor')
    nearestNeighbor(test_size,training_size);
end