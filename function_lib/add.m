classdef add < activation_fxn
    %ADD Summary of this class goes here
    %   Detailed explanation goes here

    methods
        function z = forward(x, y)
            out = tensor();
            out.value = x.value + y.value;
            self.forward_grad = 1;
            out.graph = [[x.graph, y.graph], self.pointer];
            z = out;
        end
        function gradient = backward(current_grad)
            grad = [current_grad, current_grad];
            gradient = [current_grad, current_grad];
        end
    end
end

