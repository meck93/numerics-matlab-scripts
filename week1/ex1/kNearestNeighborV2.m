% Numerical Methods in Informatics - HS 17 - Moritz Eck - Exercise 1 Task 1

% Computes the k nearest neighbor algorithm
function kNearestNeighbor(k, nr_of_test_images, nr_of_training_images)

disp("reading data");

% Load the training and the test data
% Change the filenames if you've saved the files under different names
% On some platforms, the files might be saved as 
% train-images.idx3-ubyte / train-labels.idx1-ubyte
[training_images, training_labels] = loadMNISTdata('train-images.idx3-ubyte', 'train-labels.idx1-ubyte');
[test_images, test_labels] = loadMNISTdata('t10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte');

% Set the test & training size from the input parameters
trainingSize = nr_of_training_images;
testSize = nr_of_test_images;

% Executes the nearest neighbor algorithm on the test data set
errors = 0;

for i = 1:testSize
    
    fprintf('test %d - ', i);
    
    % the first : means all rows
    % the second : means all columns
    % the third position means: the i-th page
    tv = test_images(:,:,i);
                     
    % Transpose the matrix into a 1-D vector with the (:) operation
    tv = tv(:);
    
    minIndexArray = zeros(k,1);
    minDistanceArray = zeros(k,1) + Inf;    
    
    for j = 1:trainingSize
        
        av = training_images(:,:,j);
        av = av(:);
        
        % Computes the difference between the two vectors
        diff = tv - av;
        % Convert the image from 'unit8' to double
        diff = im2double(diff);
        % Calculates the euclidian distance of the vector
        distance = norm(diff,2);   
        
        % the largest distance in the array of the currently shortest
        % distances 
        [minDist, minDistIndex] = max(minDistanceArray);
        
        % if the current distance is smaller than the largest distance of
        % the currently smallest distances then replace it 
        if (distance < minDist)
            % replace the distance
            minDistanceArray(minDistIndex) = distance;
            % replace the label index
            minIndexArray(minDistIndex) = j;
        end
    end
    
    % Pick the index of the shortest distance
    minIndex = mode(minIndexArray);
    % Choose the label of the according minIndex
    result(i) = training_labels(minIndex);
    
    % Check if estimate was accurate 
    % Accurate if the test label is equal to the result-label
    if (test_labels(i) ~= result(i))
        errors = errors + 1;
    end
    
    total = i;
    
    % Calculate the accuracy
    currentAccuracy = (total - errors) / total;
    
    % If the guess was not correct
    if (test_labels(i) ~= result(i))
        fprintf('NO MATCH | Test Label: %d, Training Label: %d | Curr Accuracy: %f\n', test_labels(i), result(i), currentAccuracy);
        continue;
    end
    
    % If the guess was correct
fprintf('MATCH | Test Label: %d, Training Label: %d | Curr Accuracy: %f\n', test_labels(i), result(i), currentAccuracy);
    
end

% Print out the accuracy after all calculations have been completed
fprintf('Total Accuracy: %f.\n', currentAccuracy);
    
    
        
        
    
    
    
    

