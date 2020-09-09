classdef mul < activation_function
    methods
        function z = forward(x, y)
            out = tensor();
            out.value = x.value * y.value;
%             self.forward_grad = 1; TODO: update forward grad
            out.graph = [[x.graph, y.graph], self.pointer];
            z = out;
        end
        function gradient = backward(current_grad)
            grad = [current_grad*y, current_grad*x];
            gradient = [
    end
end

