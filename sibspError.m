
function [sibspTable, nsibspTable, errorTotal] = sibspError(sibSp, label1, label2)

% Sibling/spouse aboard = 1 // Sibling/spouse not aboard = 0

% split data
sibspSplit = find(sibSp(:,1) == 1);
nsibspSplit = find(sibSp(:,1) == 0);
sibspTotal = size(sibspSplit);
nsibspTotal = size(nsibspSplit);
totalTotal = sibspTotal + nsibspTotal;

% split: survivors/dead && sibsp/nsibsp
sibspSurvived = find(sibSp(:,1) == 1 & sibSp(:,2) == 1);
sibspDied = find(sibSp(:,1) == 1 & sibSp(:,2) == 0);
nsibspSurvived = find(sibSp(:,1) == 0 & sibSp(:,2) == 1);
nsibspDied = find(sibSp(:,1) == 0 & sibSp(:,2) == 0);

% label
[sibspLabel, sibspMajority] = majorityLabel(size(sibspSurvived), size(sibspDied), label1, label2);
sibspError = (sibspTotal - sibspMajority)/sibspTotal;
[nsibspLabel, nsibspMajority] = majorityLabel(size(nsibspSurvived), size(nsibspDied), label1, label2);
nsibspError = (nsibspTotal - nsibspMajority)/nsibspTotal;

% POPULATE OUTPUT TABLES
sibspString = strcat("Sibling/spouse aboard: ",sibspLabel,". Options:");
nsibspString = strcat("Sibling/spouse not aboard: ",nsibspLabel,". Options:");
sibspTable = [sibspString;num2cell(sibspSplit)];
nsibspTable = [nsibspString;num2cell(sibspSplit)];

% calculate total error
errorTotal = (double(sibspError) + double(nsibspError))/max(size(totalTotal));
end