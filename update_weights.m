function [new] = update_weights(old,x,y,a)
% method to update the value of the weights
% old is the old vector of weights
% x is the current data point
% J is the function return x
% a is the annealed rate based on the data point
% new is the returned vector of updated weights
x = transpose(x);
J = y - (sum(x.*old));
new = old + ((J)*x)*(0.05/a);
end