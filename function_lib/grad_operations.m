function Grad = grad_operations(operation, a, b)

    if operation == "mult" || operation == "mult_rev"
%         disp("grad ops inputs");
%         disp(a);
%         disp(b);
        
        
        
        
        Grad = mult_back(a, b);
        
    else
%         if operation == "k_mult"
%            Grad = k_mult_back(a, b);
%         
%         else
        
        
            if operation == "add" || operation == "k_add"
                Grad = add_back(a, b);
            else

                if operation == "logistic"
                    Grad = log_back(a, b);
                else
                    Grad = ["FUCCKKKKKKKKK" "Shit" "Bitch" "Yeah shek wes and we're gettin really rich"];
                end
             end
%         end
    end



end