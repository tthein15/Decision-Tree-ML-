
function [fem_table, male_table, err_tot] = sexError(sex, label1, label2)
% Male = 0 // Female = 1

% split data
fem_Split = find(sex(:,1) == 1);
male_Split = find(sex(:,1) == 0);
fem_Tot = size(fem_Split);
male_Tot = size(male_Split);
tot_Tot = fem_Tot + male_Tot;

% split: survivors/dead && female/male
fem_Survived = find(sex(:,1) == 1 & sex(:,2) == 1);
male_Survived = find(sex(:,1) == 0 & sex(:,2) == 1);
fem_Died = find(sex(:,1) == 1 & sex(:,2) == 0);
male_Died = find(sex(:,1) == 0 & sex(:,2) == 0);

% label
[fem_Label, fem_Maj] = majorityLabel(size(fem_Survived), size(fem_Died), label1, label2);
femaleError = (fem_Tot - fem_Maj)/fem_Total;
[male_Label, male_Maj] = majorityLabel(size(male_Survived), size(male_Died), label1, label2);
maleError = (male_Tot - male_Maj)/male_Tot;

% POPULATE OUTPUT TABLES
fem_String = strcat("Female: ",fem_Label,". Options:");
male_String = strcat("Male: ",male_Label,". Options:");
fem_table = [fem_String;num2cell(femaleSplit)];
male_table = [male_String;num2cell(maleSplit)];

%(errorA + errorB)/total number of things
err_tot = (double(femaleError) + double(maleError))/max(size(tot_Tot));
end