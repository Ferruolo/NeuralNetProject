classdef MSEloss
    %MSELOSS Mean-Squared Error loss function
    %   Implementation of Mean squared error, arranged in most convenient
    %   way for matlab. 
    
    properties
    end
    
    methods
        function obj = MSEloss()
            %MSELOSS Construct an instance of this class
            %   Detailed explanation goes here
            
        end
        
        function loss = compute(obj, y_pred, y_true)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
%             disp(y_pred);
            n = y_pred.dimensions(2);

            loss = (y_true.value - y_pred.value).^2;

            loss = loss/n;
            
        end
        function loss_grad = grad_loss(obj, y_pred, y_true)
%             disp("inside the loss");
%             disp(y_pred.value);
%             disp(y_true.value);
%             disp("---loss done---");
%             
            
            n = y_pred.dimensions(2);
            y_pred.value;
            loss_grad = 2.*(y_true.value - y_pred.value);
            loss_grad = loss_grad .* (y_pred.value);
            loss_grad = loss_grad .* (1/n);
            loss_grad = max(min(loss_grad, 1), -1);
%             for i = 0:n
%             assert(2+2 == 5);
%             end
            
%             
%             if abs(loss_grad) > 1;
%                 loss_grad 
%             disp("----loss grad ------");
%             disp(loss_grad);
%             disp("*******************");
        end
        
    end
end

