for i=1:100 % for testing 

[Training, Testing] = splitTrainTest(titanictrain, 0.80);   %split data into training/testing
DT = cellstr(Training.Properties.VariableNames);            %initializes a table of features

DT(end) = [];                                               % instantiate table
DT{7,6} = [];
DT{7,1} = 0;
DT{7,2} = 0;
DT{7,3} = 0;
DT{7,4} = 0;
DT{7,5} = 0;
DT{7,6} = 0;

[root, train] = rootDecider(Training, DT);                  % determine feature for root
max = 5;                                                    % max depth
tree = treeCreator(train, root, max);                       %tree creation method
indx1 = 0;

%Train
%{
guess = 0;
if DT{4,1} > DT{5,1}
    guess = 1;
end
%}

[m, ~] = size(Testing);
predictions = zeros(m,1);
for i = 1:m
    row = Testing(i,:);
    row(:,end) = [];
    prediction = testTree(tree, row);
    predictions(i) = double(prediction.guess);
    if Testing{i, 7} == Testing{i, 2}
        indx1 = indx1 + 1;
    end
end

disp("Test Accuracy: ")
indx2 = 0;
[m, ~] = size(predictions);
for i = 1:m
    if predictions(i) == Testing{i, 7}
        indx2 = indx2 + 1;
    end
end
accurracy = indx2/m;
disp(accurracy);

disp("Training Accuracy:")  % print out accuracy
indx2 = 0;
[m, ~] = size(predictions);
for i = 1:m
    if predictions(i) == Training{i, 7}
        indx2 = indx2 + 1;
    end
end
accurracy = indx2/m;
disp(accurracy);
end