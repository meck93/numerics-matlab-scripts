clear all

# the two roots
x1 = (-62.10 + (sqrt((62.10^2) - 4)) / 2);
x2 = (-62.10 - (sqrt((62.10^2) - 4)) / 2);

%converting the result to four digits
a = [x1, x2];
j = mat2str(a, 4);
a = eval(j);

%scalar u
u = x1;

%its approximation v
v = a(1);

absErrorRoot1 = abs(u-v)
relErrorRoot1 = abs(u-v) / abs(u)

%scalar u
u = x2;

%its approximation v
v = a(2);

absErrorRoot2 = abs(u-v)
relErrorRoot2 = abs(u-v) / abs(u)