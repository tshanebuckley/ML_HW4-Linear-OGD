train = importdata('housing_train.txt');
test = importdata('housing_test.txt');
% splits train_X into attributes and target
train_X = train(:,1:13);
train_X = first_column_ones(train_X); % adds a column of 1s
train_y = train(:,14);
% splits test_X into attributes and target
test_X = test(:,1:13);
test_X = first_column_ones(test_X); % adds a column of 1s
test_y = test(:,14);
% learns weights from training set
disp('Un-normalized Data:')
w = LR_solve(train_X,train_y)
% calculates error
predicted_train = LR_predict(train_X,w);
predicted_test = LR_predict(test_X,w);
err_train = immse(predicted_train,train_y)
err_test = immse(predicted_test,test_y)
% ****Test with normalized data****
% normalize the data 
[train_mean_norm train_std_norm] = compute_norm_parameters(train);
train = normalize(train,train_mean_norm,train_std_norm);
[test_mean_norm test_std_norm] = compute_norm_parameters(test);
test = normalize(test,test_mean_norm,test_std_norm);
% splits train_X into attributes and target
train_X = train(:,1:13);
train_X = first_column_ones(train_X); % adds a column of 1s
train_y = train(:,14);
% splits test_X into attributes and target
test_X = test(:,1:13);
test_X = first_column_ones(test_X); % adds a column of 1s
test_y = test(:,14);
% learns weights from training set
disp('Normalized Data:')
w = LR_solve(train_X,train_y)
% calculates error
predicted_train = LR_predict(train_X,w);
predicted_test = LR_predict(test_X,w);
err_train = immse(predicted_train,train_y)
err_test = immse(predicted_test,test_y)