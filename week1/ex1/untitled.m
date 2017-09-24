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
  
    maxDist = Inf;
    maxDistIndex = 0; 
    
    % zeros creates a (k * 1) matrix containing all zeros = a vector with k
    % rows and 1 column
    minIndexArray = zeros(k,1);
    minDistArray = zeros(k,1);    
    
    for j = 1:trainingSize
        
        av = training_images(:,:,j);
        av = av(:);
        
        % Computes the difference between the two vectors
        diff = tv - av;
        
        % Convert the image from 'unit8' to double
        diff = im2double(diff);
        
        % Calculates the euclidian distance of the vector
        distance = norm(diff,2);        
        
        % for the first j iterations - no test need just asign the values
        if (j <= k)
            minDistArray(j) = distance;
            minIndexArray(j) = j;
            
            % Reevalute the max distance & its index of the currently 
            % shortest distances
            [M, I] = max(minDistArray);
            maxDist = M; 
            maxDistIndex = I;
            
        % after the first j values start comparing
        % find the shortest distance    
        else
            % check if the currentDist is smaller the the currently largest
            % distances of the distances in the minDistanceArray
            if (distance < maxDist)
                minDistArray(maxDistIndex) = distance;
                minIndexArray(maxDistIndex) = j;
                
                % Reevalute the max distance & its index of the currently 
                % shortest distances
                [M, I] = max(minDistArray);
                maxDist = M;
                maxDistIndex = I;                
            end
        end
    end
    
    for l = 1:k
        num(l) = training_labels(minIndexArray(l));
    end
    
    indices = zeros(10,1);
    
    for ii = 1:k
        indices(num(ii)+1) = indices(num(ii)+1) + 1;
    end
    
    [~, number] = max(indices);
    result(i) = number - 1;
    
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
        fprintf('NO MATCH | Test Label: %d, Training Label: %d | Vote: %d | Curr Accuracy: %f\n', test_labels(i), result(i), number - 1, currentAccuracy);
        continue;
    end
    
    % If the guess was correct
fprintf('MATCH | Test Label: %d, Training Label: %d | Vote: %d | Curr Accuracy: %f\n', test_labels(i), result(i), number - 1, currentAccuracy);
    
end

% Print out the accuracy after all calculations have been completed
fprintf('Total Accuracy: %f.\n', currentAccuracy);