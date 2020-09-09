function grad = mult_rev_back(a, b)

    grad = containers.Map();
    grad("A") = b;
    grad("B") = a;
end