% Hilbert's Matrix for n=4
B = [1 1/2 1/3 1/4 1/5; 1/2 1/3 1/4 1/5 1/6; 1/3 1/4 1/5 1/6 1/7; 1/4 1/5 1/6 1/7 1/8; 1/5 1/6 1/7 1/8 1/9]

% bj integral solutions for j = 0,1,...,4
b = [0 0 (1/(2*pi^2)) (3/(4*pi^2)) ((2*pi^2 - 3)/(4*pi^4))]

% coefficients c
c = B\b'