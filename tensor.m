classdef tensor
%tensor Class for low-level manipulation of tensor object and tracking
%computational graph
% 
%   Example use of tensor class:
%       Assuming A and B are tensors:
%           A = add(A, B)
%           B = mult(B, C)
%           A = mult(A, B);
%           grad = ih_grad(A);

properties
        dimensions%Shape of tensor
        graph = [graph_node("null", 0, 0, 0, false)];%Computational Graph
        value%Tensor value
        
    end
    methods

        function obj = tensor(array)
            %tensor Creates tensor object
            %   Arguments:
            %       array: Accepts matlab array
            obj.value = array;%TODO: Add gpu suppport!
            obj.dimensions = size(array);
           
        end
        function obj = update(obj, value)
            %update Method for manually updating tensor
            %   Use:
            %       Assuming B is matlab array and A is tensor
            %       A = update(A, B)
            
            obj.value = value;
            obj.dimensions = size(value);
        end
        
        function obj = add(obj, y, layer)
            %add Method for adding two tensor objects
            %   Use:
            %       Assuming A and B are tensors
            %       A = add(A, B, 0)
            %    Arguments:
            %       A tensor object to be kept
            %       B: tensor object that will become part of graph, and
            %           not be outputed
            %       layer: for managing computational graph in a network.
            %       If using without network, simply use 0.
            
          x = obj;
          obj.value = obj.value + y.value;
          disp(obj.value);
          obj.graph(length(obj.graph) +1) = graph_node("add", x, y, layer, false);

        end
        function obj = mult(obj, y, layer)
            %mult Method for multiplying two tensor objects
            %   Use:
            %       Assuming A and B are tensors
            %       A = mult(A, B, 0)
            %    Arguments:
            %       A tensor object to be kept
            %       B: tensor object that will become part of graph, and
            %           not be outputed
            %       layer: for managing computational graph in a network.
            %       If using without network, simply use 0.
            
            x = obj;
          obj.value = obj.value * y.value;

          obj.graph(length(obj.graph) +1) = graph_node("mult", x, y, layer, false);
           
        end
        function obj = mult_rev(obj, y, layer)
            %mult_rev Method for multiplying two tensor objects
            %   Preforms out = y * x
            %   Use:
            %       Assuming A and B are tensors
            %       A = mult_rev(A, B, 0)
            %    Arguments:
            %       A tensor object to be kept
            %       B: tensor object that will become part of graph, and
            %           not be outputed
            %       layer: for managing computational graph in a network.
            %       If using without network, simply use 0.
            
            x = obj;
            obj.value = y.value * obj.value;
            obj.graph(length(obj.graph) +1) = graph_node("mult_rev", x, y, layer, true);
        end
        
        function obj = div(obj, y)
          x = obj;
          obj.value = obj.value / y.value;
          obj.graph(length(obj.graph) +1) = graph_node("div", x, y, layer, false);

        end
        function obj = sub(obj, y, layer)
          x = obj;
          obj.value = obj.value - y.value;
          obj.graph(length(obj.graph) +1) = graph_node("sub", x, y, layer, false);
    
        end
%         function obj = sum_2d(obj, layer)
%             
%             pre = obj;
%             obj.value = sum(obj.value);
%             obj.value = sum(obj.value(1, :));
%             %notice difference in graph_node
%             obj.graph(length(obj.graph ) + 1) = graph_node("sum_2d", pre, obj, layer);
%         end
        function obj = k_mult(obj, y, layer)
            x = obj;
            n = y.dimensions(3);
            %n = n(3);
            prod = zeros(n, 1);
            for i = 1:n
                
                
                w = y.value(:, :, i);
               
                z = obj.value .* w;
                z = sum(z);
                prod(i) = sum(z(1, :));
            end
            obj.value = prod;
            obj.dimensions = size(obj.value);
            obj.graph(length(obj.graph)+ 1) = graph_node("k_mult", x, y, layer, false);
        end
        function obj = k_add(obj, y, layer)
            x = obj;
            obj.value = obj.value + y.value;
            obj.graph(length(obj.graph) + 1) = graph_node("k_add", x, y, layer, false);
        end

        function str = get_str(obj, num_indents)
            if length(obj.graph) == 1
                str = obj.value;
            else
                str = tensor_print(obj,  num_indents + 1);
                
            end
        end
        function  tensor_print(obj, indents)
            print_node(obj.graph(length(obj.graph)), indents);
        end
        function obj = reset_graph(obj)
            obj.graph = (graph_node("null", 0, 0) );
        end
        
        function grad =  ih_grad(obj)
            grad = auto_dif(obj.graph(length(obj.graph)));
            
        end
        function g = getGraph(obj)
            g = obj.graph;
        end
        
    end
    
end
