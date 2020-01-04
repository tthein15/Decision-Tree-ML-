function [FC_Table, NFC_Table, errorTotal] = firstclassError(firstclass, label1, label2)
% First class = 1 // Not First class = 0

% split data
FC_Split = find(firstclass(:,1) == 1);
NFC_Split = find(firstclass(:,1) == 0);
FC_Tot = size(FC_Split);
NFC_Tot = size(NFC_Split);
tot_Tot = fc_Tot + NFC_Tot;

% split: survivors/dead && firstclass/nfirstclass
FC_Survived = find(firstclass(:,1) == 1 & firstclass(:,2) == 1);
FC_Died = find(firstclass(:,1) == 1 & firstclass(:,2) == 0);
NFC_Survived = find(firstclass(:,1) == 0 & firstclass(:,2) == 1);
NFC_Died = find(firstclass(:,1) == 0 & firstclass(:,2) == 0);

% label
[FC_Label, FC_Maj] = majorityLabel(size(FC_Survived), size(FC_Died), label1, label2);
firstclassError = (FC_Tot - FC_Maj)/FC_Tot;
[NFC_Label, NFC_Maj] = majorityLabel(size(NFC_Survived), size(NFC_Died), label1, label2);
nfirstclassError = (NFC_Tot - NFC_Maj)/NFC_Tot;

% output tables
FC_String = strcat("First class: ",FC_Label,". Options:");
NFC_String = strcat("Not first class: ",NFC_Label,". Options:");
FC_Table = [FC_String;num2cell(FC_Split)];
NFC_Table = [NFC_String;num2cell(NFC_Split)];

% calculate total error
errorTotal = (double(firstclassError) + double(nfirstclassError))/max(size(tot_Tot));
end