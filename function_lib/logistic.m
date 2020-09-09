classdef logistic
    %LOGISTIC Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name;
    end
    
    methods
        function obj = logistic(name)
            %LOGISTIC Construct an instance of this class
            %   Detailed explanation goes here
            obj.name = "logistic";
            
        end
        function y = fxn_forward(obj, x)
            y = (1 + exp(-1*x)).^-1;
        end
   
    end
end

