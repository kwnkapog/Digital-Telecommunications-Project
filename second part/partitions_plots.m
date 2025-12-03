% Script for partitioning the input_signal and based on the p,N values, it
% uses the DPCM_encoder and DPCM_decoder functions to calculate the
% output_signal in the receiver, for every subset. 

%In case you want to view the input_signal with it's prediction error in
%the sender, replace the three commands with [y,~,~,~,~] = DPCM_encoder(current_subset,p,N,-3.5,3.5);
%as well as the second plot with plot(y(1:200), 'r');

% we define the values of number of prediction coefficients and bits of
% quantization
p_values = [5, 10];
N_values = [1, 2, 3];

subset_size = 5000;
num_subsets = length(input_signal) / subset_size;

for subset = 1:num_subsets
    current_subset = input_signal((subset-1)*subset_size + 1 : subset*subset_size);

    for p = p_values
        for N = N_values
            % for each combination of p,N we keep the signals we want to
            % see 
            [~,~,output_signal,~,a] = DPCM_encoder(current_subset,p,N,-3.5,3.5);
            [quant_coef,~] = my_quantizer(a,8,-2,2);
            [output_received_signal,~] = DPCM_decoder(output_signal,quant_coef);

            %We keep the first 200 samples of the signals, in order to see
            %them more clearly
            figure;
            plot(current_subset(1:200), 'b');
            hold on;
            plot(output_received_signal(1:200), 'r');

            title(['Subset ', num2str(subset), ', p=', num2str(p), ', N=', num2str(N)]);
            xlabel('Signal Index');
            ylabel('Signal Value');
            legend('Input Signal', 'Output Signal (Receiver)');
        end
    end
end