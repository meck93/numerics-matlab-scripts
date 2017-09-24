function [absolutError, relativeError] = compareErrors(value, n)

sum = 0;

for i=0:n
    % the implementation of the approximation 
    % of the function (0 = x^2 + 62.10x + 1)
    
end

% compute the absolute and relative error
absolutError = abs(value-sum);
relativeError = abs(value-sum) / abs(value);

end
