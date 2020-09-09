classdef output_layer < layer
    %LAYER Summary of this class goes here
    %   Detailed explanation goes here

    
    %LAYER Summary of this class goes here
    %   Detailed explanation goes here
%     properties
%         name
%         activation_fxn
%         weights
%         bias
%         grad
%         output
%     end

    methods
%         function obj = output_layer(name, activation_fxn, input, output, bias_shape)
%             obj.name = name;
%             obj.weights = tensor(rand(input, output));
%             obj.bias = tensor(rand(bias_shape));
%             obj.activation_fxn = activation_fxn;
%         end
        
        function x = lay_forward(obj, x)
%             disp("_-_-_-_-_-_-_-_-_-_-_-_-_-_");
%             disp(obj.name);
%             disp("Weights:");
%             disp(obj.weights.dimensions);
%             disp("mult");
%             disp(size(x.value));
            x = mult_rev(x, obj.weights, obj.name);
%             x = k_mult(x, obj.weights, obj.name);
%             x = sum_2d(x, obj.name);
%             disp("add");
%             disp(size(x.value));
            x = k_add(x, obj.bias, obj.name);
%              %activation_fxn must be manual update
%             disp("logistic");
%             disp(size(x.value));
            z = obj.activation_fxn.fxn_forward(x.value);
%             x = update(x, z);
%              disp("out");
%              disp(size(x.value));
%              disp(size(obj.weights.value));
%              disp("{}{}{}{}{}{}{}{}{}{");
            x.graph(length(x.graph) + 1) = graph_node(obj.activation_fxn.name,  x,obj.weights, obj.name, false);
            

        end
                function obj = lay_backward_mul(obj, update_fxn, running_grad)
%             disp("shape");
%             shape = size(obj.weights.value);
%             disp(shape);
%             disp("run")
%             disp(size(running_grad));

            obj.weights = bprop_compute_tensor(update_fxn, running_grad, obj.weights);


            
%             for i = 1:shape(3)
%                 run = running_grad(:, :, i);
%                 w = obj.weights.value(:, :, i);
%                 
%                 obj.weights.value(:, :, i) = bprop_compute_matrix(update_fxn, run, w );
%             end
%             
%             obj.weights = bprop_compute(update_fxn, running_grad, obj.weights);
%              obj.bias = bprop_compute(update_fxn, running_grad, obj.bias);
            

        end
        function obj = lay_backward_add(obj, update_fxn, running_grad)
%             obj.weights = bprop_compute(update_fxn, running_grad, obj.weights);
            obj.bias = bprop_compute_tensor(update_fxn, running_grad, obj.bias);
            

        end
        
        
    end
end