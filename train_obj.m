classdef train_obj
    %TRAIN_OBJ Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        img;
        label;
    end
    
    methods
        function obj = train_obj(img, label)
            %TRAIN_OBJ Construct an instance of this class
            %   Detailed explanation goes here
            obj.img = img;
            obj.label = label;
        end
        

    end
end

