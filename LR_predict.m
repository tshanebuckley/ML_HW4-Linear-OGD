function [y] = LR_predict(X,w)
%  takes input components of the test data (X) and a fixed set of weights (w), and computes vector of linear predictions y
y = X*w;