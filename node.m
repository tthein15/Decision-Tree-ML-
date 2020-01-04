classdef node       % class declaration
    properties      % variable instantiation
        f
        left
        right
        classerror
        isnode
        isleaf
    end
    methods
        function obj = node(f, left, right, error)
            obj.f = f;
            obj.left = left;
            obj.right = right;
            obj.classerror = error;
            obj.isnode = 1;
            obj.isleaf = 0;
        end
        function outputArg = isanode(obj)
            outputArg = obj.isnode;
        end
        function outputArg2 = isaleaf(obj)
            outputArg2 = obj.isleaf;
        end
    end
end
