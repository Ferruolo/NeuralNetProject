function grad = log_back(A, B)
        grad = containers.Map();
        uno = ones(size(A));

        grad("A") = B;
        
        grad("B") = (uno-A).*(A);

end
