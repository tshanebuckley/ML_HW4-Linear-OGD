function new_X = first_column_ones(X)
% adds a new column of ones to the front (left-most side) of X
% make a column vector of 1s same size as the size of columns in X
s = size(X);
s = s(1);
new_column = ones(s,1);
% add new_column as first column of X
new_X = [new_column,X];
end

