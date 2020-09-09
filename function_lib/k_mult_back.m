function grad = k_mult_back(A, B)
    disp("__--__--__--__--__");
    disp("k mult Gradient:");
    disp("A: ");
    disp(size(A));
    disp("---");
    disp("B: ");
    disp(size(B));

    grad = containers.Map();
    shape = size(A);
    grad_a = zeros(shape);
    for i = 1:shape(1)
        for k = 1:shape(2)
            grad_a(i, k) = B;
        end
    end
    grad("A") = grad_a;
    grad("B") = A; 
end

