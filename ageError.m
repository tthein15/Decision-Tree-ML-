function [youngTable, oldTable, errorTotal] = ageError(age, label1, label2)
% (age <= 25) = 1 // (age > 25) = 0

% split data
youngSplit = find(age(:,1) == 1);
oldSplit = find(age(:,1) == 0);
youngTotal = size(youngSplit);
oldTotal = size(oldSplit);
totalTotal = youngTotal + oldTotal;

% split: survivors/dead && young/old
youngSurvived = find(age(:,1) == 1 & age(:,2) == 1);    %find = indices and values of nonzero elements
youngDied = find(age(:,1) == 1 & age(:,2) == 0);
oldSurvived = find(age(:,1) == 0 & age(:,2) == 1);
oldDied = find(age(:,1) == 0 & age(:,2) == 0);

% label
[youngLabel, youngMajority] = majorityLabel(size(youngSurvived), size(youngDied), label1, label2);
youngError = (youngTotal - youngMajority)/youngTotal;
[oldLabel, majO] = majorityLabel(size(oldSurvived), size(oldDied), label1, label2);
oldError = (oldTotal - majO)/oldTotal;

% output tables
young = strcat("Young (<= 25): ",youngLabel,". Options:");  %Concatenate strings horizontally
old = strcat("Old (> 25): ",oldLabel,". Options:");         %Concatenate strings horizontally
youngTable = [young;num2cell(youngSplit)];                  %Convert array to cell array with consistently sized cells
oldTable = [old;num2cell(oldSplit)];                        %Convert array to cell array with consistently sized cells

% calculate total error
errorTotal = (double(youngError) + double(oldError))/max(size(totalTotal));
end