clear all

% the two roots
x1 = (-62.10 + (sqrt((62.10^2) - 4)) / 2);
x2 = (-62.10 - (sqrt((62.10^2) - 4)) / 2);

%converting the result to four digits
a = [x1, x2];
j = mat2str(a, 4);
a = eval(j);

[abs, rel] = compareErrors(x1, 10);

fprintf('Absolute Error: %f - ', abs);
fprintf('Relative Error: %f\n', rel);
