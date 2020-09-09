classdef lay_wrapper
    %LAY_WRAPPER Summary of this class goes here
    %   Detailed explanation goes here
    properties
        layer
    end
        
    
    methods
        function obj = lay_wrapper(layer)%This is the dumbest fucking thing ive ever done. Fuck this langauge

            obj.layer = layer;
        end
        
        function x = lw_forward(obj,x)
            x = lay_forward(obj.layer, x);
        end
        function obj = lw_backward_mul(obj, update_fxn, running_grad)
            obj.layer = lay_backward_mul(obj.layer, update_fxn, running_grad);
        end
        function obj = lw_backward_add(obj, update_fxn, running_grad)
            obj.layer = lay_backward_add(obj.layer, update_fxn, running_grad);
        end
    end
end

