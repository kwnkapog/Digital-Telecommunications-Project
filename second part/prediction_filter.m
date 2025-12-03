function [r, R, a] = prediction_filter(p, x)
% Prediction_filter inputs:
%   1. p: the number of previous values of the signal we want to keep.
%   2. x: the input signal.
%
% Prediction_filter outputs:
%   1. r: self-correlation vector of size px1.
%   2. R: self-correlation matrix of size pxp.
%   3. a: vector of the prediction filter coefficients.

N = length(x);
frac = 1/(N-p);
r = zeros(p,1);
R = zeros(p,p);
a = zeros(p,1);

% We calculate the rx(i) which go to r(i)
for i = 1 : p
    sum = 0;
    for n = p+1 : N 
        sum = sum + (x(n)*x(n-i));
    end
    r(i) = sum*frac;
end

% We calculate the Rx(i - j) which go to the R(i,j)
for i = 1 : p 
    for j = 1 : p
        sum = 0;
        for n = p+1 : N
            sum = sum + x(n - j)*x(n - i);
        end
        R(i,j) = sum*frac;
    end
end

% We calculate the coefficients, using the Yule Walker equations.
a = R\r;

end

