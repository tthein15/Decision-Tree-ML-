function [all_Features,best_Feature,best_Error] = bestFeature(filename)

% file && survived data
filename = 'titanictrain.csv' %OR RESPECTIVE FILENAME
data = readtable(filename);
survived = data.Survived;

% Matrix
first_Class = [data.First_class, survived(:,:)];
sex = [data.Sex, survived(:,:)];
age = [data.Age, survived(:,:)];
sibSp = [data.SibSp, survived(:,:)];
parCh = [data.ParCh, survived(:,:)];
embarked = [data.Embarked, survived(:,:)];

% Finds error of each feature
[FC1, FC2, FCE] = firstclassError(first_Class, 'survived', 'died');
[S1, S2, SE] = sexError(sex, 'survived', 'died');
[A1, A2, AE] = ageError(age, 'survived', 'died');
[SS1, SS2, SSE] = sibspError(sibSp, 'survived', 'died');
[PC1, PC2, PCE] = parchError(parCh, 'survived', 'died');
[E1, E2, EE] = barkingError(embarked, 'survived', 'died');

% Determines feature with smallest error
errors = [FCE SE AE SSE PCE EE];
features = ["First_class", "Sex", "Age", "SibSp", "ParCh", "Embarked"];
[best_Error,fname] = min(errors);
best_Feature = features(fname);

% Table with feature/error
all_Features = [features; num2cell(errors)];
end
