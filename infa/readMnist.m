%path = "infa/mnist_png/mnist_png/training/"
function data = readMnist(path_to_training)
    file_paths = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    data = [train_obj("null", "null")];
    for i= 1:length(file_paths)
        path = strcat(path_to_training, file_paths(i), '/');
        dinfo = dir(fullfile(path));
        dinfo([dinfo.isdir]) = [];     %get rid of all directories including . and ..
        nfiles = length(dinfo);
        for k = 1:nfiles
            true = zeros(1, 10);
            true(1, i) = 1;
            
            
            
            data(length(data) + 1) = train_obj(tensor(min(double(imread(strcat(path, dinfo(k).name))), 1)), tensor(true));

%           if class(data(k).img) == "string"
%                 disp(class(data(length(k)).img));
%                 disp(k);
%                 disp("--------------------------");
%             end
            
        end
        
    end
    data = data(2:end);
end