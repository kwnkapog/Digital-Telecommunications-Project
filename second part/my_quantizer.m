function [y_cap,centers] = my_quantizer(y,N,min_value,max_value)
% MY_QUANTIZER inputs:
%   1. y: the input signal to be quantized.
%   2. N: the number of bits used for the representation of the
%   representative values.
%   3. min_value: maximum value of quantization.
%   4. max_value: minimum value of quantization.
%
% MY_QUANTIZER outputs:
%   1. yn: the quantized signal.
%   2. centers: the representative values of each quantizaton level.

% We calculate the number of quantization levels (dynamic regions).
L = 2^N;

% We calculate the step size
D = (max_value - min_value) / L;

% We now have L levels of quantization each of size D. We now calculate the
% center of each quantization levelas the middle of each level.

centers = min_value + D/2 : D : max_value - D/2;

% We preallocate the space for the quantized signal
 y_cap = zeros(size(y));

 % Quantize each element of the input signal. This is achieved by
 % creating a vector with the absolute difference of the value with each of
 % the centers.Then we find the position of the minimum value in that
 % vector and we insert the value of the center in the same position in the
 % quantized output signal.
   for i = 1:length(y)
       [~, idx] = min(abs(centers - y(i)));
       y_cap(i) = centers(idx);
   end
end

