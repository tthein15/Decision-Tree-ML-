function [indicesSurvived, indicesDied, ultLabelSurvived, ultLabelDied, classError] = featureSplit(feature, survival)

SurvivedSuccess = 0;
DiedSuccess = 0;
SurvivedFail = 0;
DiedFail = 0;

indicesSurvived = {};
indicesDied = {};
ultLabelSurvived = {};
ultLabelDied = {};

for i = 1:height(feature)
    if feature{i,1} == survival{i,1} && survival{i,1} == 1
           SurvivedSuccess = SurvivedSuccess + 1;
           indicesSurvived{end+1} = i;
           ultLabelSurvived{end+1} = i;
    elseif feature{i,1} == survival{i,1} && survival{i,1} == 0
           DiedSuccess = DiedSuccess + 1;
           indicesDied{end+1} = i;
           ultLabelDied{end+1} = i;
    elseif feature{i,1} ~= survival{i,1} && survival{i,1} == 1
           SurvivedFail = SurvivedFail + 1;
           indicesDied{end+1} = i;
           ultLabelSurvived{end+1} = i;
    elseif feature{i,1} ~= survival{i,1} && survival{i,1} == 0
           DiedFail = DiedFail + 1;
           indicesSurvived{end+1} = i;
           ultLabelDied{end+1} = i;
    end

end
classError = double(double(SurvivedFail + DiedFail)/double(SurvivedSuccess + DiedSuccess + SurvivedFail + DiedFail));
end