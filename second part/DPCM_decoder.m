function [output_received_signal,predicted_received_signal] = DPCM_decoder(received_signal,quantized_coeff)
% DPCM_decoder inputs:
%   1. received_signal: The signal that gets outputted at the transmitter end.
%   2. quantized_coeff: The coefficients that get quantized at the transmitter end and sent to the receiver beforehand..
%
% DPCM_decoder outputs:
%   1. output_received_signal: The signal that gets outputted at the receiver end.
%   2. predicted_received_signal: The output of the predictorat the receiver end.

output_received_signal = zeros(size(received_signal));
predicted_received_signal = zeros(size(received_signal));

for i = 1 : length(received_signal)
    output_received_signal(i) = received_signal(i) + predicted_received_signal(i);
    predicted_received_signal = predictor(quantized_coeff, length(received_signal),output_received_signal);
end
end

