% Input Matrix A
A = [2 -1; -1 2];

% plot settings (step-size relaxation param)
w_min = 0.1;
w_max = 2;
w_step = 0.1;

% Input adjustment
D = diag(diag(A));
E = tril(A);
I = eye(2);

% calculating the spectral radius for each w
x = [];
y = [];
for w = w_min:w_step:w_max
  % Computing the iteration matrix
  T = I - ((1-w)/w * D + E)^-1 * A;

  % Retrieving the spectral radius (max eigenvalue)
  eig_T = eig(T);
  spectral_radius = max(abs(eig_T));
  
  % Adding the x & y value to the arrays
  x(end + 1) = w;
  y(end + 1) = spectral_radius;
end

% plot the data

plot(x,y)
xlabel('Relaxation Parameter w')
ylabel('Spectral Radius p')