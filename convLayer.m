classdef convLayer < layer
    %CONVLAYER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Property1
    end
    
    methods
        function obj = convLayer(name, activation_fxn, kernels, kernel_shape, input_size, output_size)
            obj.name = name;
            obj.weights = rand(input_size, output_size, kernels);
            obj.bias = rand(output_size, kernels);
            obj.activation_fxn = activation_fxn;
        end

        
        function outputArg = lay_forward(obj, x)
            output = zeros(
        end
    end
end

