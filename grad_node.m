classdef grad_node
    %GRAD_NODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        A_grad;
        B_grad;
        A;
        B;
        layer;
        flipped;
    end
    
    methods
        function obj = grad_node(A_grad, B_grad, A, B, layer, flipped)
            obj.A_grad = A_grad;
            obj.B_grad = B_grad;
            obj.A = A;
            obj.B = B;
            obj.layer = layer;
            obj.flipped = flipped;
        end

    end
end

