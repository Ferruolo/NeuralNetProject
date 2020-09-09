classdef graph_node
    %GRAPH_NODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        operation;
        x_val;
        y_val;
        layer;
        flipped;
    end
    
    methods
        function obj = graph_node(operation, x_val, y_val, layer_name, flipped)
            obj.operation = operation;
            obj.x_val = x_val;
            obj.y_val = y_val;
            obj.layer = layer_name;
            obj.flipped = flipped;
        end

        function print_node(obj, num_indents)
            spaces = "";
            for i = 1:num_indents
                spaces = spaces + "    ";
            end
            x = get_str(obj.x_val, num_indents);
            y = get_str(obj.y_val, num_indents);
            
           
            disp(spaces + "Operation: " + obj.operation + "\n" + spaces + "X: " +  print(x_val) + "\nY: " + print(y_val));
            
        end
        function out =  auto_dif(obj)
            if obj.operation ~= "null"
               
                A = ih_grad(obj.x_val);
                B = ih_grad(obj.y_val);
                

                
                
                
                
                %The problem is right here!!!
                grad = grad_operations(obj.operation, obj.x_val.value, obj.y_val.value);
%                 disp("_-_-INSIDE AD_-_-_-_");
%                 disp("A");
%                 disp(size(grad("A")));
%                 disp("b");
%                 disp(size(grad("B")));
%                 disp("END CELL");
                out = grad_node(grad("A"), grad("B"), A, B, obj.layer, obj.flipped);

            else
                out = grad_node(0, 0, 0, 0, obj.layer, obj.flipped);
            end
        end
    end
end