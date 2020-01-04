function [embarkedTable, DNE_Table, errorTotal] = barkingError(embarked, label1, label2)
% Embarked = 1 // Nembark = 0

% split data
embarked_Split = find(embarked(:,1) == 1);
DNE_Split = find(embarked(:,1) == 0);
embarked_Tot = size(embarked_Split);
DNE_Tot = size(DNE_Split);
tot_Tot = embarked_Total + DNE_Total;

% split: survivors/dead && embarked/nembarked
embarked_Survived = find(embarked(:,1) == 1 & embarked(:,2) == 1);
embarked_Died = find(embarked(:,1) == 1 & embarked(:,2) == 0);
DNE_Survived = find(embarked(:,1) == 0 & embarked(:,2) == 1);
DNE_Died = find(embarked(:,1) == 0 & embarked(:,2) == 0);

% label
[embarkedLabel, embarked_Maj] = majorityLabel(size(embarked_Survived), size(embarked_Died), label1, label2);
embarkedError = (embarked_Tot - embarked_Maj)/embarked_Tot;
[DNE_Label, DNE_Maj] = majorityLabel(size(DNE_Survived), size(DNE_Died), label1, label2);
nembarkedError = (DNE_Tot - DNE_Maj)/DNE_Tot;

% output tables
embarkedOutput = strcat("Embarked: ",embarkedLabel,". Options:");
nembarkedOutput = strcat("Did not embark: ",DNE_Label,". Options:");
embarkedTable = [embarkedOutput;num2cell(embarkedSplit)];
DNE_Table = [nembarkedOutput;num2cell(nembarkedSplit)];

% calculate total error
errorTotal = (double(embarkedError) + double(nembarkedError))/max(size(tot_Tot));
end