classdef network
    %NETWORK high-level class for creating, training, and running neural
    %network
    % Example use of network class:
    %   loss_fxn = MSEloss();
    %   update_fxn = SGD(0.1);
    %   net = network(layers, update_fxn);
    %   net = train(net, data, 100, loss_fxn);
    %   net = forward(net, input);
    %   disp(net.output);

    properties
        output; %Output of last use of net_forward
        layers = [lay_wrapper(layer("null", "null", 0, 0, 0))]; %List of network layers
        update_fxn;%method of updating weights
    end
    
    methods
        function obj = network(architecture, update_fxn)
        %network creates network object
        %   Arguments:
        %       Architecture: Takes a list of the layers for the network
        %       Update Fxn: Takes an update function (ie MSEloss)
     

            for i = 1:length(architecture)
                obj.layers(length(obj.layers)+ 1) = architecture(i); 
                
                


            end    
            obj.layers = obj.layers(2:end);
            obj.update_fxn = update_fxn;
            
        end
        
        function [obj] = net_forward(obj, x)
            %net_forward Forward implementation of network
            %   Arguments:
            %       obj: The network in question
            %       x: tensor input to network
            %   Output:
            %       Network Output, or output produced by layers passed to
            %       architecture
            y = x;

            for i = 1:length(obj.layers)
                y = lw_forward(obj.layers(i), y);

            end

            
            obj.output = y;
        end
        function obj = net_backwards(obj, loss_grad)
            %net_backwards Backpropagates network, should only be used by
            %train, left public incase user wants something more
            %customizeable

            grad = ih_grad(obj.output);
   
            
            running_grad =  loss_grad;
  
            
                 %Probably some hack code, but it seems to work universally
                %for the purpose of this project.
                %looking at the graph (you can do that yourself), you wil
                %find that for each layer, there is mult, add, activate.
                %Using this knowledge, we know that if the current grad
                %node is of type "k_mult," the next grad will be of a
                %different layer, and if the node is of type "logistic" or
                %another activation function, there will be two more grad
                %nodes in the same layer. This allows me to use the < and
                %== logic that you see below. I have tested this with a
                %very verbose print, and it seems to work, even for the
                %conv layers.            
            for i = 1:length(obj.output.graph)-1
                dex = length(obj.output.graph) - (i-1);


                if grad.A.layer < grad.layer
 
                    if grad.flipped

                        cell_grad =     running_grad * transpose(grad.B_grad);
                        running_grad =   transpose(grad.A_grad)* running_grad ; 

                        obj.layers(grad.layer) = lw_backward_mul(obj.layers(grad.layer), obj.update_fxn, cell_grad);                        
                    else
                        cell_grad =   transpose(grad.B_grad) * running_grad ;
                        running_grad =   running_grad * transpose(grad.A_grad);                       
                        

                        obj.layers(grad.layer) = lw_backward_mul(obj.layers(grad.layer), obj.update_fxn, cell_grad); 
                    end
                    
                    
                    

                    
                else
                    if grad.A.layer == grad.layer && grad.A.A.layer < grad.layer
  
                        obj.layers(grad.layer) = lw_backward_add(obj.layers(grad.layer), obj.update_fxn, running_grad); 
                    else
                        if grad.A.A.layer == grad.layer
                          running_grad =  grad.B_grad .* running_grad; 
                        end
                    end
                end
                grad = grad.A;
                
            end
        end
        function obj = train(obj, data, epochs, loss_fxn)
            %train Trains neural network, returns, trained object
            %   Arguments:
            %       Obj: Network Object
            %       data: Data for network to be trained on, should be list
            %           of train_objs
            %       epochs: Number of epochs network will train for
            %       loss_fxn: How to calculate loss, should have compute
            %       and grad methods
            for i = 1:epochs
                
                for k = 1:length(data)
                     obj = net_forward(obj, data(k).img);
                    loss = loss_fxn.compute(obj.output, data(k).label);
                    nabla_loss = loss_fxn.grad_loss(obj.output, data(k).label);
                    obj = net_backwards(obj, nabla_loss);                            
                     disp("Epoch: " + string(i) + " Item: " +  string(k)  + " Loss: " + string(mean(loss))); 
                end
              
            end
        end
        
    end
end

