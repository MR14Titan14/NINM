min_val = -1;
max_val = 1;
num_points = 5;

x1 = linspace(min_val, max_val, num_points);
x2 = linspace(min_val, max_val, num_points);

[X1, X2] = meshgrid(x1, x2);

Y = (X1-1).^2 + (2-X2).^2;
dlmwrite('testing_data.dat', [X1(:), X2(:), Y(:)], 'delimiter', '\t');