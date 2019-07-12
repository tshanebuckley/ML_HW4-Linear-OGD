function [w] = LR_solve(X,y)
% takes X and y components of the data and returns a vector of coefficients w with the minimal mean square fit
w = X\y;
end