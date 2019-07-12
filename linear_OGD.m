function [w] = linear_OGD(X,Y,I)
% method for online gradient descent of a linear model
% argument X is the NxD data matrix of N examples and D attributes
% Y a vector of the target attribute
% argument I is the number of iterations
% output w is the vector of weights to be returned
n = size(X);
w = zeros(n(2),1); % initializes weights as a vector of zeroes
c = 1; % initializes counter
x = []; % initializes x of i (vector of X(i))
i = 0; %initialize instance variable
while c ~= I+1
    % if i > n
    if c > n(1)
        i = mod(c,n(1))+1;
    else
        i = c;
    end
    x = X(i,:); % gets instance of X(i) for updating weights
    y = Y(i); % gets instance of the target attribute at Y(i)
    w = update_weights(w,x,y,i); % updates weights
    if sum(isnan(w)) > 0
        d = ['Function breaks at ',num2str(c)];
        disp(d)
        w
        break;
    end
    c = c+1; % increments counter
end
end