A = [2 -1; -1 2];
D = diag(diag(A));
E = tril(A);
I = eye(2);

% spectral radius of jacbi iteration matrix
pj = 0.5;

% optimal relaxation parameter w
w = 2 / (1 + sqrt(1 - pj^2));

% iteration matrix for SOR (successive over relaxation)
T = I - ((((1-w)/w)*D-E)^-1)*A;

% eigenvalues & spectral radius of the iteration matrix
eigT = eig(T);
spectral_radius = max(eigT)
