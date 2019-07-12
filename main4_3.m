train = importdata('housing_train.txt');
test = importdata('housing_test.txt');
train_O = train;
test_O = test;
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
w = linear_OGD(train_X,train_y,1000) % self-contained procedure, but not 
% compatible with the graphing functions
% calculates error
predicted_train = LR_predict(train_X,w);
predicted_test = LR_predict(test_X,w);
err_train = immse(predicted_train,train_y)
err_test = immse(predicted_test,test_y)
g = init_progress_graph; % initializes the graph
w = zeros(14,1); % initialize weights with zeroes
i = 0; % initialize i
% update graph
for c = 1:1000 % iterates through 1000 instances of updating weights
    % if i > n
    if c > 433
        i = mod(c,433)+1;
    else
        i = c;
    end
    % update weights 
    w = update_weights(w,train_X(i,:),train_y(i),i);
    % graph every 50th instance
    if mod(c,50) == 0
        predicted_train = LR_predict(train_X,w);
        err_train = immse(predicted_train,train_y);
        predicted_test = LR_predict(test_X,w);
        err_test = immse(predicted_test,test_y);
        g = add_to_progress_graph(g, c, err_train, err_test);
    end
end
% ****Test with un-normalized data****
% splits train_X into attributes and target
train_O_X = train_O(:,1:13);
train_O_X = first_column_ones(train_O_X); % adds a column of 1s
train_O_y = train_O(:,14);
% splits test_X into attributes and target
test_O_X = test_O(:,1:13);
test_O_X = first_column_ones(test_O_X); % adds a column of 1s
test_O_y = test_O(:,14);
% learns weights from training set
disp('Un-normalized Data:')
w = linear_OGD(train_O_X,train_O_y,1000) % self-contained procedure, but not 
% compatible with the graphing functions
% calculates error
predicted_train_O = LR_predict(train_O_X,w);
predicted_test_O = LR_predict(test_O_X,w);
err_train_O = immse(predicted_train_O,train_O_y)
err_test_O = immse(predicted_test_O,test_O_y)
% ****Commented out section attempting to graph un-normalized data****
%{
g = init_progress_graph; % initializes the graph
w = zeros(14,1); % initialize weights with zeroes
i = 0; % initialize i
% update graph
for c = 1:1000 % iterates through 1000 instances of updating weights
    % if i > n
    if c > 74
        i = mod(c,74)+1;
    else
        i = c;
    end
    % update weights 
    w = update_weights(w,train_O_X(i,:),train_O_y(i),i);
    % graph every 50th instance
    if mod(c,50) == 0
        predicted_train_O = LR_predict(train_O_X,w);
        err_train_O = immse(predicted_train_O,train_O_y);
        predicted_test_O = LR_predict(test_O_X,w);
        err_test_O = immse(predicted_test_O,test_O_y);
        g = add_to_progress_graph(g, c, err_train_O, err_test_O);
    end
end
%}