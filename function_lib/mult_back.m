function grad = mult_back(a, b)
%     disp("--mulback--");
%     disp(size(a));
%     disp(size(b));
%     disp("---endmulback---");


    grad = containers.Map();
    grad("A") = b;
    grad("B") = a;
    
end