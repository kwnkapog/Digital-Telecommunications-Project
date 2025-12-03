function [y,y_cap_tone,output_signal,predicted_signal,a] = DPCM_encoder(input_signal,p,N,min_value,max_value)
% DPCM_encoder inputs:
%   1. y: Prediction error.
%   2. y_cap_tone: processed output signal.
%   3. output_signal: the signal that gets transmitted to the receiver.
%   4. predicted_signal:  the predicted signal.
%   5. a: the coefficients of the prediction of the signal.
%
% DPCM_encoder outputs:
%   1. input_signal: the signal that we wnat to transmit.
%   2. p: the number of coefficients we want.
%   3. N,min_value,max_value: See my_quantizer.m

% We initialize the vectors.
[~,~,a] = prediction_filter(p,input_signal);
predicted_signal = zeros(size(input_signal));
y = zeros(size(input_signal));
output_signal = zeros(size(input_signal));
y_cap_tone = zeros(size(input_signal));

% We implement the given functions of the exercise.
for i = 1: length(input_signal)
    y(i) = input_signal(i) - predicted_signal(i);
    [output_signal(i),~] = my_quantizer(y(i),N,min_value,max_value);
    y_cap_tone(i) = output_signal(i) + predicted_signal(i);
    predicted_signal = predictor(a, length(input_signal),y_cap_tone);
end
end

