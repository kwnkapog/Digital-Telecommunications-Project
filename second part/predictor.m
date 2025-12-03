function [predicted_signal] = predictor(a,n,y_cap_tone)
% predictor inputs:
%   1. a: The prediction coefficients used to predict the signal's values.
%   2. n: The size of the signal.
%   3. y_cap_tone: the processed output signal, which is the input of the
%   predictor
%
% predictοr outputs:
%   1. predicted_signal: the signal, whose values are the predictions of
%   the input signal.

%preallocate the space of the vector
predicted_signal = zeros(n,1);

%first value is zero because the first iteration has no previous value of
%the input signal, to calculate a prediction
predicted_signal(1) = 0;

% i is equal to p+1 or length(a)+1, to ensure the i-j parameter inside the
% loop is positive. This means the first p values of the predicted_signal
% are 0. We could try to fill them out, though this would cause a additive
% error in the next calculations.
for i = length(a)+1 : n 
    for j = 1 : length(a)
        predicted_signal(i) =  predicted_signal(i) + a(j) * y_cap_tone(i-j);
    end
end
end

