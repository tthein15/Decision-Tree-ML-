
function [parchTable, nparchTable, errorTotal] = parchError(parCh, label1, label2)
% Parent/child aboard = 1 // Parent/child not aboard = 0

% split data
parchSplit = find(parCh(:,1) == 1);
nparchSplit = find(parCh(:,1) == 0);
parchTotal = size(parchSplit);
nparchTotal = size(nparchSplit);
totalTotal = parchTotal + nparchTotal;

% split: survivors/dead && parch/nparch
parchSurvived = find(parCh(:,1) == 1 & parCh(:,2) == 1);
parchDied = find(parCh(:,1) == 1 & parCh(:,2) == 0);
nparchSurvived = find(parCh(:,1) == 0 & parCh(:,2) == 1);
nparchDied = find(parCh(:,1) == 0 & parCh(:,2) == 0);

% label
[parchLabel, parchMajority] = majorityLabel(size(parchSurvived), size(parchDied), label1, label2);
parchError = (parchTotal - parchMajority)/parchTotal;
[nparchLabel, nparchMajority] = majorityLabel(size(nparchSurvived), size(nparchDied), label1, label2);
nparchError = (nparchTotal - nparchMajority)/nparchTotal;

% output tables
parchString = strcat("Parent/child aboard: ",parchLabel,". Options:");
nparchString = strcat("No parent/child aboard: ",nparchLabel,". Options:");
parchTable = [parchString;num2cell(parchSplit)];
nparchTable = [nparchString;num2cell(nparchSplit)];

% calculate total error
errorTotal = (double(parchError) + double(nparchError))/max(size(totalTotal));
end