classdef leaf       % class declaration
    properties      % variable instantiation
        guess
        isleaf
        isnode
    end  
    methods
        function obj = leaf(guess, error)   %leaf categorization by bianry value
            obj.guess = guess;
            obj.isleaf = 1;
            obj.isnode = 0;
        end
        function outputArg3 = isanode(obj)  %if node
            outputArg3 = obj.isnode;
        end
        function outputArg4 = isaleaf(obj)  %if lead
            outputArg4 = obj.isleaf;
        end
    end
end

