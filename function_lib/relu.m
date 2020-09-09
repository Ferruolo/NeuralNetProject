classdef relu
    %RELU Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name
    end
    
    methods
        function obj = relu(name)
            %RELU Construct an instance of this class
            %   Detailed explanation goes here
            obj.name = name;
        end
        function y = forward(x)
                y = max(0, x);
        end
    end
end

