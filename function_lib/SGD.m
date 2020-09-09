classdef SGD
    % Summary of this class goes here
    %   Detailed explanation goes here
    properties
        learning_rate;
    end

    
    methods
        function obj = SGD(learning_rate)
            % Construct an instance of this class
            %   Detailed explanation goes here
            obj.learning_rate = learning_rate;

        end
        
        function tbu = bprop_compute_matrix(obj, running_grad, tbu)%To Be Updated
                if (running_grad > 0) 
                running_grad = max(0.001, running_grad);
                 else 
                running_grad = min(-0.001, running_grad);
                end
%              disp(tbu);
%              disp(size(running_grad));
            tbu = tbu - obj.learning_rate * running_grad;
        end
        function tbu = bprop_compute_tensor(obj, running_grad, tbu)%To Be Updated
%              disp(tbu);
%              disp(size(running_grad));
               tbu.value = tbu.value - obj.learning_rate * running_grad;
        end
    end
end

