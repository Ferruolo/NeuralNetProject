A = rand(28, 50);
B = rand(50, 10);
C = rand(1, 28);

X = rand(28);

disp("Lay 1");
X = X * A;
disp(size(X));
disp("Lay 2");
X = X * B;
disp(size(X));
disp("Lay 3");
X = C * X;
disp(size(X));
