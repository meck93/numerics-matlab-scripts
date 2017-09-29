x = linspace(0.2*pi, 50);
y = sin(x);
y2 = cos(x);

plot(x, [y', y2']);

xlabel('x');
ylabel('y');

title('my first plot');

legend('sin', 'cos');