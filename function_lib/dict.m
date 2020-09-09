function fxn = dict(operation)
    operations = containers.Map;
    operations('add') = add_back;
    operations('mult') = mult_back;
    %Add operation here 
    fxn = operations(operation);
end

