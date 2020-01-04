function [label, majority] = majorityLabel(survived, died, label1, label2)
majority = max(survived, died); 
    if majority == survived
        label = label1;
    else
       label = label2;
    end
end
